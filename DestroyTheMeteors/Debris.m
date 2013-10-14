//
//  Debris.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/14/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Debris.h"
#import "CollisionDetection.h"
#import "ContactDetection.h"

@implementation Debris

- (instancetype)init {
    self = [super initWithImageNamed: @"debris"];
    if (self) {
        self.xScale = 0.5;
        self.yScale = 0.5;
        self.name = [self.class nodeName];
        [self setupPhysicsBody];
    }
    return self;
}

- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.size];
    self.physicsBody.categoryBitMask = [self.class physicsCategory];
    self.physicsBody.contactTestBitMask = [ContactDetection contactTestBitMaskForClass: self.class];
    self.physicsBody.collisionBitMask = [CollisionDetection collisionBitMaskForClass: self.class];
    self.physicsBody.linearDamping = 0.01;
    self.physicsBody.angularDamping = 0.01;
}

+ (NSUInteger)physicsCategory {
    return 0x1 << 5;
}

+ (NSString *)nodeName {
    return @"debris";
}

@end
