//
//  Cannon.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Cannon.h"

static const CGFloat LOWER_LIMIT = 0;
static const CGFloat UPPER_LIMIT = (M_PI/2) - (M_PI/12);

@implementation Cannon

- (instancetype) init {
    self = [[Cannon alloc] initWithImageNamed: @"cannon"];
    return self;
}

- (CGFloat) thresholdExtrapolationByAngle: (CGFloat) angle {
    CGFloat result = self.angle + angle;
    if (result < LOWER_LIMIT) {
        return LOWER_LIMIT - result;
    } else if (result > UPPER_LIMIT) {
        return result - UPPER_LIMIT;
    } else {
        return 0;
    }
}

- (void)rotateByAngle:(CGFloat)angle {
    CGFloat extrapolation = [self thresholdExtrapolationByAngle: angle];
    if (extrapolation > 0) {
        angle = angle + ((angle > 0) ? -1 : 1) * extrapolation;
    }
    SKAction* rotate = [SKAction rotateByAngle: angle duration: 0.2];
    [self runAction: rotate];
    self.angle += angle;
}

- (void)translateTipWithVector:(CGVector)t descend:(BOOL)descend {
    CGFloat a = sqrt(t.dx * t.dx + t.dy * t.dy);
    CGFloat b = self.size.width;
    CGFloat c = b;
    CGFloat cosA = (b * b + c * c - a * a)/(2 * b * c); // cosine law
    CGFloat rad = ((descend) ? -1 : 1) * acos(cosA);
    [self rotateByAngle: rad];
}

@end
