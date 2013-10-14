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
#import "MathUtils.h"

@implementation MeteorRain

- (instancetype)init {
    self = [super init];
    return self;
}

- (CGVector) randomVelocityVector {
    CGFloat magnitude = [MathUtils randomNumberBetweenLowerLimit: 900.0 andUpperLimit: 1100.0];
    CGVector vector = CGVectorMake(-magnitude, -magnitude);
    return vector;
}

- (CGFloat) randomAngularVelocity {
    return [MathUtils randomNumberBetweenLowerLimit: 20.0 andUpperLimit: 50.0];
}

- (CGPoint) randomPositionForMeteor: (Meteor*) meteor inScene: (SKScene*) scene {
    CGFloat lower = scene.size.width/2;
    CGFloat upper = scene.size.width - meteor.size.width - 50;
    CGFloat x = [MathUtils randomNumberBetweenLowerLimit: lower andUpperLimit: upper];
    CGFloat y = scene.size.height + meteor.size.height;
    return CGPointMake(x, y);
}

- (Meteor *)meteorForScene:(SKScene *)scene {
    Meteor* meteor = [[Meteor alloc] init];
    
    CGVector velocity = [self randomVelocityVector];
    CGFloat angularVelocity = [self randomAngularVelocity];
    CGPoint position = [self randomPositionForMeteor: meteor inScene: scene];
    meteor.position = position;
    meteor.physicsBody.velocity = velocity;
    meteor.physicsBody.angularVelocity = angularVelocity;
    
    return meteor;
}

- (void)startInScene:(SKScene *)scene {
    SKAction* addMeteor = [SKAction runBlock:^{
        Meteor* meteor = [self meteorForScene: scene];
        [scene addChild: meteor];
    }];
    
    NSTimeInterval interval = [MathUtils randomNumberBetweenLowerLimit: 0.9 andUpperLimit: 1.2];
    SKAction* pause = [SKAction waitForDuration: interval];
    
    SKAction* rainLoop = [SKAction sequence: @[ addMeteor, pause ]];
    SKAction* repeat = [SKAction repeatActionForever: rainLoop];
    SKAction* sequence = [SKAction sequence: @[ [SKAction waitForDuration: 2.5], repeat]];
    [scene runAction: sequence];
}

@end
