//
//  MathUtils.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/12/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "MathUtils.h"

@implementation MathUtils

+ (CGFloat) randomNumberBetweenLowerLimit: (CGFloat) lower andUpperLimit: (CGFloat) upper {
    CGFloat diff = upper - lower;
    return (((CGFloat) (arc4random() % ((unsigned) RAND_MAX + 1)) / RAND_MAX) * diff) + lower;
}

@end
