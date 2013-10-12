//
//  CollisionDetector.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/12/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "ContactDetection.h"
#import "Ground.h"
#import "Bullet.h"
#import "Meteor.h"
#import "MathUtils.h"

@implementation ContactDetection

+ (NSDictionary *)contactTestMap {
    return @{
        @"ground": @[@([Bullet physicsCategory]), @([Meteor physicsCategory])],
        @"bullet": @[@([Ground physicsCategory]), @([Meteor physicsCategory])],
        @"meteor": @[@([Bullet physicsCategory]), @([Ground physicsCategory])],
    };
}

+ (NSUInteger) contactTestBitMaskForClass: (Class) class {
    NSArray* masks = self.contactTestMap[[class nodeName]];
    return [MathUtils conjunctionOfBitMasks: masks];
}

@end
