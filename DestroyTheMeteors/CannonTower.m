//
//  Cannon.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "CannonTower.h"
#import "Cannon.h"

static NSString* CANNON_NODE = @"cannon";

static const CGFloat LOWER_LIMIT = 0;
static const CGFloat UPPER_LIMIT = (M_PI/3);

@implementation CannonTower

- (instancetype)init {
    self = [super initWithImageNamed: @"tower"];
    if (self) {
        Cannon* cannon = [[Cannon alloc] initWithImageNamed: @"cannon"];
        cannon.position = CGPointMake(12, 58);
        cannon.name = CANNON_NODE;
        cannon.zPosition = -1;
        [self addChild: cannon];
    }
    return self;
}

- (Cannon*) cannon {
    return (Cannon*) [self childNodeWithName: CANNON_NODE];
}

- (void) pointTo:(CGPoint)location {
    CGPoint cannonPos = [self convertPoint: self.cannon.position toNode: self.scene];
    CGFloat h = location.y - cannonPos.y;
    CGFloat w = MAX(location.x - cannonPos.x, 1);
    CGFloat angle = atan(h/w);
    angle = MAX(angle, LOWER_LIMIT);
    angle = MIN(angle, UPPER_LIMIT);
    [self.cannon rotateToAngle: angle];
}

- (BOOL)nodeIsCannon:(SKNode *)node {
    return [node.name isEqualToString: CANNON_NODE];
}

@end
