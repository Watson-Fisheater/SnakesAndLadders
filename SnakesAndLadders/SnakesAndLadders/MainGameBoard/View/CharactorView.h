//
//  CharactorView.h
//  SnakesAndLadders
//
//  Created by Wang Sen on 25/2/17.
//  Copyright © 2017 Watson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CharactorModel.h"

@interface CharactorView : UIView

@property (retain, nonatomic) UIImageView *mainBody;
@property (retain, nonatomic) UIImageView *expression;
@property (retain, nonatomic) CharactorModel *charactorModel;


-(instancetype)initWithCenter:(CGPoint)center;


-(void)moveFromPosition:(CGPoint)fromPos toPosition:(CGPoint)toPos duration:(NSTimeInterval)duration;
@end
