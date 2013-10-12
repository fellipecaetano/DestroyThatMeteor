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
        self.size = CGSizeMake(8, 8);        
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.size];
        self.physicsBody.categoryBitMask = [MeteorFragment physicsCategory];
        self.physicsBody.collisionBitMask = [CollisionDetection collisionBitMaskForClass: self.class];
        self.name = [self.class nodeName];
    }
    return self;
}

+ (NSUInteger)physicsCategory {
    return 0x1 << 4;
}

+ (NSString *)nodeName {
    return @"meteorFragment";
}

@end
