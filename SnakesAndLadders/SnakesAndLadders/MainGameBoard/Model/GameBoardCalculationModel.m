//
//  GameBoardCalculationModel.m
//  SnakesAndLadders
//
//  Created by Wang Sen on 26/2/17.
//  Copyright © 2017 Watson. All rights reserved.
//

#import "GameBoardCalculationModel.h"




@implementation StepInfo
-(instancetype)init
{
    self = [super init];
    self.center = CGPointZero;
    self.isStartStep = NO;
    self.isEndStep = NO;
    self.bonus = BonusTypeNone;
    self.destinationIndex = -1;
    return self;
}

@end


@implementation GameBoardCalculationModel
{
    NSDictionary *bonusDesignInfo;
}

static GameBoardCalculationModel *_sharedInstance;

+(instancetype)sharedInstance:(CGRect)gameBoardRect
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[GameBoardCalculationModel alloc] init];
        _sharedInstance.gameBoardRect = gameBoardRect;
        [_sharedInstance initGameBoardStepArray];
        
    });
    
    return _sharedInstance;
}

-(void)initGameBoardStepArray
{
    self.stepArray = [[NSMutableArray alloc] initWithCapacity:100];
    CGPoint centerPoint = CGPointMake(self.gameBoardRect.origin.x + StepSize_10_10 /2, self.gameBoardRect.origin.y + StepSize_10_10 * 9.5);
    for (int index = 0; index < 100; index++) {
        StepInfo *stepInfoObject = [[StepInfo alloc] init];
        //center
        float xChange = 0;
        float yChange = 0;
        if ((index >= 1 && index < 10) ||
            (index >= 21 && index < 30) ||
            (index >= 41 && index < 50) ||
            (index >= 61 && index < 70) ||
            (index >= 81 && index < 90)) {
            xChange = 30;
            yChange = 0;
        }else if (index == 10 || index == 20 || index == 30 || index == 40 || index == 50 || index == 60 || index == 70 || index == 80 || index == 90){
            xChange = 0;
            yChange = -30;
        }else if ((index >= 11 && index < 20) ||
                  (index >= 31 && index < 40) ||
                  (index >= 51 && index < 60) ||
                  (index >= 71 && index < 80) ||
                  (index >= 91 && index < 100)) {
            xChange = -30;
            yChange = 0;
        }
        centerPoint = CGPointMake(centerPoint.x + xChange, centerPoint.y + yChange);
        stepInfoObject.center = centerPoint;
        //start or end
        if (index == 0) {
            stepInfoObject.isStartStep = YES;
        }else if (index == 99){
            stepInfoObject.isEndStep = YES;
        }
        //bonus & destinationIndex
        stepInfoObject.bonus = [self getBonusTypeForStep:index];
        stepInfoObject.destinationIndex = [self getDestinationIndexForStep:index];
        [self.stepArray addObject:stepInfoObject];
    }
}

-(BonusType)getBonusTypeForStep:(int)index
{
    if (bonusDesignInfo == nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BonusDesign" ofType:@"plist"];
        bonusDesignInfo = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    }
    
    NSDictionary *stepInfo = [[bonusDesignInfo objectForKey:@"10*10"] objectAtIndex:index];
    
    BonusType type = BonusTypeNone;
    if ([stepInfo[@"bonus"] isEqualToString:@"BonusTypeNone"]) {
        type = BonusTypeNone;
    }else if ([stepInfo[@"bonus"] isEqualToString:@"BonusTypeLadderUp"]) {
        type = BonusTypeLadderUp;
    }else if ([stepInfo[@"bonus"] isEqualToString:@"BonusTypeSnakeDown"]) {
        type = BonusTypeSnakeDown;
    }else if ([stepInfo[@"bonus"] isEqualToString:@"BonusTypeStrawberry"]) {
        type = BonusTypeStrawberry;
    }
    return type;
}

-(int)getDestinationIndexForStep:(int)index
{
    if (bonusDesignInfo == nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BonusDesign" ofType:@"plist"];
        bonusDesignInfo = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    }
    
    NSDictionary *stepInfo = [[bonusDesignInfo objectForKey:@"10*10"] objectAtIndex:index];
    
    return [stepInfo[@"destinationIndex"] intValue];
}

-(CGPoint)getStepCenterForIndex:(int)index
{
    StepInfo *infoObject = self.stepArray[index];
    return infoObject.center;
}

@end
