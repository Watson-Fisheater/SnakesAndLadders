//
//  GameBoardCalculationModel.h
//  SnakesAndLadders
//
//  Created by Wang Sen on 26/2/17.
//  Copyright © 2017 Watson. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StepInfo : NSObject
@property (assign, nonatomic) CGPoint center;
@property (assign, nonatomic) BOOL isStartStep;
@property (assign, nonatomic) BOOL isEndStep;
@property (assign, nonatomic) BonusType bonus;
@property (assign, nonatomic) int destinationIndex;
@end

@interface GameBoardCalculationModel : NSObject
@property (strong, nonatomic) NSMutableArray<StepInfo *> *stepArray;
@property (assign, nonatomic) CGRect gameBoardRect;



+(instancetype)sharedInstance:(CGRect)gameBoardRect;

-(CGPoint)getStepCenterForIndex:(int)index;
@end
