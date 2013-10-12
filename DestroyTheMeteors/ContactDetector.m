//
//  CollisionDetector.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/12/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "ContactDetector.h"
#import "Ground.h"
#import "Bullet.h"
#import "Meteor.h"

@implementation ContactDetector

+ (NSDictionary *)contactTestMap {
    return @{
        @"ground": @[@([Bullet physicsCategory]), @([Meteor physicsCategory])],
        @"bullet": @[@([Ground physicsCategory]), @([Meteor physicsCategory])],
        @"meteor": @[@([Bullet physicsCategory]), @([Ground physicsCategory])],
    };
}

+ (NSUInteger) contactTestBitMaskForClass: (Class) class {
    NSArray* masks = self.contactTestMap[[class nodeName]];
    NSUInteger result = 0;
    
    for (NSNumber* mask in masks) {
        result |= mask.unsignedIntegerValue;
    }
    
    return result;
}

@end
