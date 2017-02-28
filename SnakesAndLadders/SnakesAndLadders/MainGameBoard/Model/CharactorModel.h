//
//  CharactorModel.h
//  SnakesAndLadders
//
//  Created by Wang Sen on 25/2/17.
//  Copyright © 2017 Watson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface CharactorModel : NSObject<CAAnimationDelegate>
@property (weak, nonatomic) UIView *bodyView;
@property (assign, nonatomic) NSTimeInterval duration;

@property (assign, nonatomic) int currentStep;
//


-(void)startBodyMotion:(BodyMoitonType)motionType view:(UIView *)view duration:(NSTimeInterval)duration;
-(void)stopBodyMotion;

-(void)move:(UIView *)view fromPosition:(CGPoint)fromPosition toPosition:(CGPoint)toPosition duration:(NSTimeInterval)duration;
-(void)move:(UIView *)view frames:(NSArray<NSValue *> *)frames duration:(NSTimeInterval)duration;

@end
