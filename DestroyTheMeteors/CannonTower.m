//
//  Cannon.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "CannonTower.h"
#import "Cannon.h"
#import "Bullet.h"

static NSString* CANNON_NODE = @"cannon";

static const CGFloat LOWER_LIMIT = (M_PI/7);
static const CGFloat UPPER_LIMIT = (M_PI/3);
static const CGFloat BULLET_IMPULSE = 900;

@implementation CannonTower

- (instancetype)init {
    self = [super initWithImageNamed: @"tower"];
    if (self) {
        Cannon* cannon = [[Cannon alloc] initWithImageNamed: @"cannon"];
        cannon.position = CGPointMake(12, 58);
        cannon.name = CANNON_NODE;
        cannon.zPosition = -1;
        [cannon rotateToAngle: LOWER_LIMIT];
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

- (Bullet *)fireInNode:(SKNode *)node {
    CGPoint tip = [node convertPoint: self.cannon.tip.position fromNode: self.cannon.parent];
    Bullet* bullet = [[Bullet alloc] init];
    bullet.position = CGPointMake(tip.x + 25.0, tip.y + 66.0);
    [node addChild: bullet];
    bullet.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.size];
    CGVector vector = (CGVector) {
        .dx = BULLET_IMPULSE * cosf(self.cannon.angle),
        .dy = BULLET_IMPULSE * sinf(self.cannon.angle)
    };
    [bullet.physicsBody applyImpulse: vector];
    return bullet;
}

@end
