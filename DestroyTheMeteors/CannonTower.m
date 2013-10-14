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
#import "CollisionDetection.h"
#import "Debris.h"
#import "MathUtils.h"
#import "TowerArson.h"

static const CGFloat LOWER_LIMIT = (M_PI/7);
static const CGFloat UPPER_LIMIT = (M_PI/3);
static const CGFloat BULLET_IMPULSE = 2;

@implementation CannonTower

- (instancetype)init {
    self = [super initWithImageNamed: @"tower"];
    if (self) {
        [self createCannon];
        [self setupPhysicsBody];
    }
    return self;
}

- (void) createCannon {
    Cannon* cannon = [[Cannon alloc] init];
    cannon.position = CGPointMake(0, 50);
    cannon.zPosition = -1;
    [cannon rotateToAngle: LOWER_LIMIT];
    [self addChild: cannon];
}

- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.size];
    self.physicsBody.categoryBitMask = [self.class physicsCategory];
    self.physicsBody.collisionBitMask = [CollisionDetection collisionBitMaskForClass: self.class];
    self.physicsBody.mass = 180000;
    self.name = [self.class nodeName];
}

+ (NSUInteger)physicsCategory {
    return 0x1 << 3;
}

+ (NSString *)nodeName {
    return @"tower";
}

- (Cannon*) cannon {
    return (Cannon*) [self childNodeWithName: [Cannon nodeName]];
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

- (Bullet *)fireInNode:(SKNode *)node {
    CGPoint rotatedTip = (CGPoint) {
        .x = self.cannon.size.width * cosf(self.cannon.angle),
        .y = self.cannon.size.width * sinf(self.cannon.angle)
    };
    CGPoint cannonPos = [node convertPoint: self.cannon.position fromNode: self.cannon.parent];
    CGPoint translatedTip = CGPointMake(rotatedTip.x + cannonPos.x, rotatedTip.y + cannonPos.y);
    CGPoint bulletPos = translatedTip;
    
    Bullet* bullet = [[Bullet alloc] init];
    bullet.position = bulletPos;
    [node addChild: bullet];
    
    CGVector vector = (CGVector) {
        .dx = BULLET_IMPULSE * cosf(self.cannon.angle),
        .dy = BULLET_IMPULSE * sinf(self.cannon.angle)
    };
    
    [bullet.physicsBody applyImpulse: vector];
    return bullet;
}

- (Debris*) randomDebrisObject {
    Debris* debris = [[Debris alloc] init];
    CGFloat x = [MathUtils randomNumberBetweenLowerLimit: self.position.x andUpperLimit: self.position.x + self.size.width];
    CGFloat y = [MathUtils randomNumberBetweenLowerLimit: self.position.y andUpperLimit: self.position.y + self.size.height];
    CGFloat angular = [MathUtils randomNumberBetweenLowerLimit: 10.0 andUpperLimit: 35.0];
    debris.position = CGPointMake(x, y);
    debris.physicsBody.angularVelocity = angular;
    return debris;
}

- (void) explodeInNode: (SKNode*) node {
    NSInteger amount = 9;
    
    for (NSInteger i = 0; i < amount; i++) {
        Debris* debris = [self randomDebrisObject];
        [node addChild: debris];
    }
    
    TowerArson* arson = [TowerArson towerArson];
    arson.position = CGPointMake(self.position.x + 15, self.position.y - 50);
    [node addChild: arson];
}

@end
