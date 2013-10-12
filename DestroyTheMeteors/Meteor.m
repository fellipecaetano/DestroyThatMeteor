//
//  Meteor.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/11/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Meteor.h"
#import "ContactDetection.h"
#import "CollisionDetection.h"
#import "MeteorFragment.h"
#import "MathUtils.h"

@implementation Meteor

- (instancetype) init {
    self = [super initWithImageNamed: @"meteor"];
    if (self) {
        self.xScale = 0.5;
        self.yScale = 0.5;
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.size];
        self.physicsBody.mass = 0.0008;
        self.physicsBody.categoryBitMask = [self.class physicsCategory];
        self.physicsBody.contactTestBitMask = [ContactDetection contactTestBitMaskForClass: self.class];
        self.physicsBody.collisionBitMask = [CollisionDetection collisionBitMaskForClass: self.class];
        self.name = [self.class nodeName];
    }
    return self;
}

+ (NSUInteger) physicsCategory {
    return 0x1 << 1;
}

+ (NSString *)nodeName {
    return @"meteor";
}

- (void)explodeInNode:(SKNode *)node {
    NSInteger amount = 8;
    CGFloat speed = 400.0;
    
    for (NSInteger i = 0; i < amount; i++) {
        MeteorFragment* fragment = [[MeteorFragment alloc] init];
        CGFloat angle = [MathUtils randomNumberBetweenLowerLimit: 0 andUpperLimit: 2 * M_PI];
        CGVector velocity = CGVectorMake(speed * cosf(angle), speed * sinf(angle));
        fragment.physicsBody.velocity = velocity;
        fragment.position = [node convertPoint: self.position fromNode: self.parent];
        [node addChild: fragment];

        [fragment runAction: [SKAction fadeOutWithDuration: 0.5] completion:^{
            [fragment removeFromParent];
        }];
        
        angle += M_PI_4;
    }
}

@end
