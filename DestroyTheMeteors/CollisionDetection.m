//
//  CollisionDetector.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/12/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "CollisionDetection.h"
#import "Ground.h"
#import "CannonTower.h"
#import "Bullet.h"
#import "MeteorFragment.h"
#import "Meteor.h"
#import "MathUtils.h"
#import "Debris.h"

@implementation CollisionDetection

+ (NSDictionary *)collisionMap {
    return @{
        @"ground": @[
            @([CannonTower physicsCategory]),
            @([Bullet physicsCategory]),
            @([MeteorFragment physicsCategory]),
            @([Meteor physicsCategory]),
        ],
        @"tower": @[
            @([Ground physicsCategory]),
            @([Bullet physicsCategory]),
            @([Meteor physicsCategory]),
        ],
        @"bullet": @[
            @([Ground physicsCategory]),
            @([CannonTower physicsCategory]),
            @([Meteor physicsCategory]),
        ],
        @"meteor": @[
            @([Ground physicsCategory]),
            @([CannonTower physicsCategory]),
            @([Bullet physicsCategory]),
        ],
        @"meteorFragment": @[
            @([Ground physicsCategory]),
        ],
        @"debris": @[
            @([Ground physicsCategory]),
            @([Debris physicsCategory])
        ]
    };
}

+ (NSUInteger)collisionBitMaskForClass:(Class)class {
    NSArray* masks = self.collisionMap[[class nodeName]];
    return [MathUtils conjunctionOfBitMasks: masks];
}

@end
