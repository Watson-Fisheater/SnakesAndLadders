//
//  CommonDefineFile.h
//  SnakesAndLadders
//
//  Created by Wang Sen on 25/2/17.
//  Copyright © 2017 Watson. All rights reserved.
//

#ifndef CommonDefineFile_h
#define CommonDefineFile_h

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, BodyMoitonType){
    BodyMotionTypeNone = 0,
    BodyMotionTypeGo = 1,
    BodyMotionTypeFall = 2,
    BodyMotionTypeShake = 3,
    BodyMotionTypeCelebrate = 4
};

typedef NS_ENUM(NSInteger, BonusType) {
    BonusTypeNone = 0,
    BonusTypeLadderUp = 1,
    BonusTypeSnakeDown = 2,
    BonusTypeStrawberry = 3
};

#define StepSize_10_10 30.0
#define StepSize_8_8 40.0

#endif /* CommonDefineFile_h */

