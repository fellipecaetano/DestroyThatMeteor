//
//  Cannon.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Cannon.h"

@implementation Cannon

- (instancetype) init {
    self = [[Cannon alloc] initWithImageNamed: @"cannon"];
    return self;
}

- (void)rotateToAngle:(CGFloat)angle {
    SKAction* rotate = [SKAction rotateToAngle: angle duration: 0.2];
    [self runAction: rotate];
}

@end
