//
//  CharactorView.m
//  SnakesAndLadders
//
//  Created by Wang Sen on 25/2/17.
//  Copyright © 2017 Watson. All rights reserved.
//

#import "CharactorView.h"
#import "GameBoardCalculationModel.h"

@implementation CharactorView
{
    GameBoardCalculationModel *gameBoard;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


//-(instancetype)init
//{
//    self = [super init];
//    
//    gameBoard = [GameBoardCalculationModel sharedInstance:CGRectZero];
//    CGPoint startStepCenter = [gameBoard getStepCenterForIndex:0];
//    self = [super initWithFrame:CGRectMake(startStepCenter.x - 25, startStepCenter.y - 25, 50, 50)];
//    self.backgroundColor = [UIColor lightGrayColor];
//    
//    self.mainBody = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 20, 20)];
//    self.mainBody.image = [UIImage imageNamed:@"dawda"];
//    self.mainBody.backgroundColor = [UIColor redColor];
//    
//    self.expression = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//    self.expression.image = [UIImage imageNamed:@"dawdawda"];
//    self.expression.backgroundColor = [UIColor yellowColor];
//    
//    [self addSubview:self.mainBody];
//    [self addSubview:self.expression];
//    self.charactorModel = [[CharactorModel alloc] init];
//    
//    
//    return self;
//}
- (instancetype)initWithFrame:(CGRect)frame
{
    gameBoard = [GameBoardCalculationModel sharedInstance:CGRectZero];
    CGPoint startStepCenter = [gameBoard getStepCenterForIndex:0];
    
    self = [super initWithFrame:CGRectMake(startStepCenter.x - 25, startStepCenter.y - 25, 50, 50)];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.mainBody = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 20, 20)];
        self.mainBody.image = [UIImage imageNamed:@"dawda"];
        self.mainBody.backgroundColor = [UIColor redColor];
        
        self.expression = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        self.expression.image = [UIImage imageNamed:@"dawdawda"];
        self.expression.backgroundColor = [UIColor yellowColor];
        
        [self addSubview:self.mainBody];
        [self addSubview:self.expression];
        self.charactorModel = [[CharactorModel alloc] init];
    }
    return self;
}

//-(void)moveFromPosition:(CGPoint)fromPos toPosition:(CGPoint)toPos duration:(NSTimeInterval)duration
//{
//    [self.charactorModel startBodyMotion:BodyMoitonTypeGo view:self.mainBody duration:0.5];
//    [self.charactorModel move:self fromPosition:fromPos toPosition:toPos duration:4];
//}
-(void)moveToStep:(int)toStepIndex bonusType:(BonusType)bonusType duration:(NSTimeInterval)duration
{
    BodyMoitonType bodyMotion = BodyMotionTypeNone;
    switch (bonusType) {
        case BonusTypeNone:
        case BonusTypeLadderUp:
            bodyMotion = BodyMotionTypeGo;
            break;
        case BonusTypeSnakeDown:
            bodyMotion = BodyMotionTypeFall;
            break;
        case BonusTypeStrawberry:
            bodyMotion = BodyMotionTypeCelebrate;
            break;
            
        default:
            break;
    }
    [self.charactorModel startBodyMotion:bodyMotion view:self.mainBody duration:0.5];
    
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    if (bonusType == BonusTypeLadderUp || bonusType == BonusTypeSnakeDown) {
        [frames addObject:[NSValue valueWithCGPoint:[gameBoard getStepCenterForIndex:self.charactorModel.currentStep]]];
        [frames addObject:[NSValue valueWithCGPoint:[gameBoard getStepCenterForIndex:toStepIndex]]];
    }else if (bonusType == BonusTypeNone) {
        for (int i = self.charactorModel.currentStep; i <= toStepIndex; i++) {
            [frames addObject:[NSValue valueWithCGPoint:[gameBoard getStepCenterForIndex:i]]];
        }
    }
    
    [self.charactorModel move:self frames:frames duration:duration];
    self.charactorModel.currentStep = toStepIndex;
}

@end
