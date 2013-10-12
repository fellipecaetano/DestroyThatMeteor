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
    self = [super initWithImageNamed: @"cannon"];
    if (self) {
        self.anchorPoint = CGPointMake(0, 0);
        self.name = [self.class nodeName];
    }
    return self;
}

+ (NSString *)nodeName {
    return @"cannon";
}

- (void)rotateToAngle:(CGFloat)angle {
    self.angle = angle;    
    SKAction* rotate = [SKAction rotateToAngle: angle duration: 0.1];
    [self runAction: rotate];
}

@end
