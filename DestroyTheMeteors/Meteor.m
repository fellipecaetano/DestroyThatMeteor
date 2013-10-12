//
//  Meteor.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/11/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Meteor.h"
#import "Ground.h"

@implementation Meteor

- (instancetype) init {
    self = [super initWithColor: [SKColor brownColor] size: CGSizeMake(60, 60)];
    if (self) {
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.size];
        self.physicsBody.mass = 0.00005;
        self.physicsBody.categoryBitMask = [self.class physicsCategory];        
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

@end
