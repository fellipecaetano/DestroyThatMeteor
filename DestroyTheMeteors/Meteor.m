//
//  Meteor.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/11/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Meteor.h"
#import "ContactDetector.h"

@implementation Meteor

- (instancetype) init {
    self = [super initWithColor: [SKColor brownColor] size: [self.class size]];
    if (self) {
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.size];
        self.physicsBody.mass = 0.0008;
        self.physicsBody.categoryBitMask = [self.class physicsCategory];
        self.physicsBody.contactTestBitMask = [ContactDetector contactTestBitMaskForClass: self.class];
        self.name = [self.class nodeName];
    }
    return self;
}

+ (CGSize)size {
    return CGSizeMake(30, 30);
}

+ (NSUInteger) physicsCategory {
    return 0x1 << 1;
}

+ (NSString *)nodeName {
    return @"meteor";
}

@end
