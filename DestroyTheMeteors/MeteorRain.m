//
//  MeteorRain.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/11/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "MeteorRain.h"
#import "Meteor.h"
#import "Ground.h"

@implementation MeteorRain

- (instancetype)init {
    self = [super init];
    return self;
}

- (CGFloat) randomNumberBetweenLowerLimit: (CGFloat) lower andUpperLimit: (CGFloat) upper {
    CGFloat diff = upper - lower;
    return (((CGFloat) (arc4random() % ((unsigned) RAND_MAX + 1)) / RAND_MAX) * diff) + lower;
}

- (CGVector) randomVelocityVector {
    CGFloat magnitude = [self randomNumberBetweenLowerLimit: 500.0 andUpperLimit: 750.0];
    CGFloat angle = [self randomNumberBetweenLowerLimit: M_PI/5 andUpperLimit: M_PI/3 + M_PI/12];
    CGVector vector = CGVectorMake(-magnitude * cosf(angle), -magnitude * sinf(angle));
    return vector;
}

- (CGPoint) randomPositionForMeteor: (Meteor*) meteor inScene: (SKScene*) scene {
    CGFloat lower = scene.size.width/2;
    CGFloat upper = scene.size.width - meteor.size.width - 50;
    CGFloat x = [self randomNumberBetweenLowerLimit: lower andUpperLimit: upper];
    CGFloat y = scene.size.height + meteor.size.height;
    return CGPointMake(x, y);
}

- (Meteor *)meteorForScene:(SKScene *)scene {
    Meteor* meteor = [[Meteor alloc] init];
    
    CGVector velocity = [self randomVelocityVector];
    CGPoint position = [self randomPositionForMeteor: meteor inScene: scene];
    meteor.position = position;
    meteor.physicsBody.velocity = velocity;
    return meteor;
}

- (void)startInScene:(SKScene *)scene {
    SKAction* addMeteor = [SKAction runBlock:^{
        Meteor* meteor = [self meteorForScene: scene];
        [scene addChild: meteor];
    }];
    
    NSTimeInterval interval = [self randomNumberBetweenLowerLimit: 0.4 andUpperLimit: 0.8];
    SKAction* pause = [SKAction waitForDuration: interval];
    
    SKAction* sequence = [SKAction sequence: @[ addMeteor, pause ]];
    SKAction* repeat = [SKAction repeatActionForever: sequence];
    [scene runAction: repeat];
}

@end
