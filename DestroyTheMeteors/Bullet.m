//
//  Bullet.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Bullet.h"
#import "ContactDetector.h"

@implementation Bullet

- (instancetype)init {
    self = [super initWithColor: [SKColor blackColor] size: CGSizeMake(5, 5)];
    if (self) {
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.size];
        self.physicsBody.usesPreciseCollisionDetection = YES;
        self.physicsBody.categoryBitMask = [self.class physicsCategory];
        self.physicsBody.contactTestBitMask = [ContactDetector contactTestBitMaskForClass: self.class];
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
