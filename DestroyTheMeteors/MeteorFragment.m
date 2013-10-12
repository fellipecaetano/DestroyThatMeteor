//
//  MeteorFragment.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/12/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "MeteorFragment.h"

@implementation MeteorFragment

- (instancetype) init {
    self = [super initWithColor: [SKColor brownColor] size: CGSizeMake(10, 10)];
    if (self) {
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.size];
        self.physicsBody.categoryBitMask = 0;
        self.physicsBody.collisionBitMask = 0;
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
