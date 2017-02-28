//
//  CharactorModel.m
//  SnakesAndLadders
//
//  Created by Wang Sen on 25/2/17.
//  Copyright © 2017 Watson. All rights reserved.
//

#import "CharactorModel.h"

@implementation CharactorModel
{
    NSTimer *bodyMotionTimer;
}

-(instancetype)init
{
    self = [super init];
    self.currentStep = 0;
    return self;
}

-(void)startBodyMotion:(BodyMoitonType)motionType view:(id)view duration:(NSTimeInterval)duration
{
    self.bodyView = view;
    self.duration = duration;
    switch (motionType) {
        case BodyMotionTypeGo:
            [self goBodyMotion];
            break;
        case BodyMotionTypeFall:
            [self fallBodyMotion];
            break;
        case BodyMotionTypeShake:
            [self shakeBodyMotion];
            break;
        case BodyMotionTypeCelebrate:
            [self celebrateBodyMotion];
            break;
            
        default:
            break;
    }
    
}

-(void)stopBodyMotion
{
    //    [bodyMotionTimer invalidate];
    //    bodyMotionTimer = nil;
    [self.bodyView.layer removeAnimationForKey:@"repeat"];
    self.bodyView = nil;
}

-(void)goBodyMotion
{
    CGPoint redViewPosition = self.bodyView.layer.position;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
//    animation.values = @[
//                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y)],
//                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y - 30)],
//                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y - 45)],
//                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y - 50)],
//                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y - 45)],
//                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y - 30)],
//                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y)]
//                         ];
    animation.values = @[
                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y)],
                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y - 10)],
                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y - 14)],
                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y - 15)],
                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y - 14)],
                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y - 10)],
                         [NSValue valueWithCGPoint:CGPointMake(redViewPosition.x, redViewPosition.y)]
                         ];
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    animation.duration = self.duration;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    [self.bodyView.layer addAnimation:animation forKey:@"repeat"];
}
-(void)fallBodyMotion
{
    
}
-(void)shakeBodyMotion
{
    
}
-(void)celebrateBodyMotion
{
    
}

-(void)move:(UIView *)view fromPosition:(CGPoint)fromPosition toPosition:(CGPoint)toPosition duration:(NSTimeInterval)duration
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.values = @[
                         [NSValue valueWithCGPoint:CGPointMake(fromPosition.x, fromPosition.y)],
                         [NSValue valueWithCGPoint:CGPointMake(toPosition.x, toPosition.y)]
                         ];
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = self;
    [view.layer addAnimation:animation forKey:nil];
    
}
-(void)move:(UIView *)view frames:(NSArray<NSValue *> *)frames duration:(NSTimeInterval)duration
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.values = frames;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = self;
    [view.layer addAnimation:animation forKey:nil];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self stopBodyMotion];
}

@end
