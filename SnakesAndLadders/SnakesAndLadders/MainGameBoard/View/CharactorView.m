//
//  CharactorView.m
//  SnakesAndLadders
//
//  Created by Wang Sen on 25/2/17.
//  Copyright © 2017 Watson. All rights reserved.
//

#import "CharactorView.h"

@implementation CharactorView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithCenter:(CGPoint)center
{
    self = [super initWithFrame:CGRectMake(center.x - 25, center.y - 25, 50, 50)];
    self.backgroundColor = [UIColor lightGrayColor];
    
    self.mainBody = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    self.mainBody.image = [UIImage imageNamed:@"dawda"];
    self.mainBody.backgroundColor = [UIColor redColor];
    
    self.expression = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.expression.image = [UIImage imageNamed:@"dawdawda"];
    self.expression.backgroundColor = [UIColor yellowColor];
    
    [self addSubview:self.mainBody];
    [self addSubview:self.expression];
    self.charactorModel = [[CharactorModel alloc] init];
    
    
    return self;
}

-(void)moveFromPosition:(CGPoint)fromPos toPosition:(CGPoint)toPos duration:(NSTimeInterval)duration
{
    [self.charactorModel startBodyMotion:BodyMoitonTypeGo view:self.mainBody duration:0.5];
    [self.charactorModel move:self fromPosition:fromPos toPosition:toPos duration:4];
}

@end
