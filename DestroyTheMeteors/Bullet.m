//
//  Bullet.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Bullet.h"
#import "ContactDetection.h"
#import "CollisionDetection.h"

@implementation Bullet

- (instancetype)init {
    self = [super initWithImageNamed: @"bullet"];
    if (self) {
        self.yScale = 0.25;
        self.xScale = 0.25;
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.size];
        self.physicsBody.usesPreciseCollisionDetection = YES;
        self.physicsBody.categoryBitMask = [self.class physicsCategory];
        self.physicsBody.contactTestBitMask = [ContactDetection contactTestBitMaskForClass: self.class];
        self.physicsBody.collisionBitMask = [CollisionDetection collisionBitMaskForClass: self.class];        
        self.name = [self.class nodeName];
    }
    return self;
}

+ (NSString *)nodeName {
    return @"bullet";
}

+ (NSUInteger)physicsCategory {
    return 0x1 << 2;
}

@end
