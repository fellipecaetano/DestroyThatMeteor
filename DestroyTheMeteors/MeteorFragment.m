//
//  MeteorFragment.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/12/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "MeteorFragment.h"
#import "CollisionDetection.h"

@implementation MeteorFragment

- (instancetype) init {
    self = [super initWithImageNamed: @"meteor"];
    if (self) {
        self.name = [self.class nodeName];
        self.xScale = 0.125;
        self.yScale = 0.125;
        [self setupPhysicsBody];
    }
    return self;
}

- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.size];
    self.physicsBody.categoryBitMask = [MeteorFragment physicsCategory];
    self.physicsBody.collisionBitMask = [CollisionDetection collisionBitMaskForClass: self.class];
}

+ (NSUInteger)physicsCategory {
    return 0x1 << 4;
}

+ (NSString *)nodeName {
    return @"meteorFragment";
}

@end
