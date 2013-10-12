//
//  GameScene.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "GameScene.h"
#import "Ground.h"
#import "CannonTower.h"
#import "Cannon.h"
#import "Bullet.h"
#import "Meteor.h"
#import "MeteorRain.h"

@interface GameScene()

@property (strong, nonatomic) MeteorRain* meteorRain;

@end

@implementation GameScene

- (void)didMoveToView:(SKView *)view {
    self.backgroundColor = [SKColor colorWithRed: 135.0/255.0 green: 206.0/255.0 blue: 250.0/255.0 alpha: 1];
    self.scaleMode = SKSceneScaleModeAspectFit;
    self.physicsWorld.contactDelegate = self;
    [self createScenario];
    [self createCannonTower];
    [self startMeteorRain];
}

- (void) createScenario {
    Ground* ground = [[Ground alloc] initWithWidth: self.size.width];
    ground.position = CGPointMake(0, 64);
    ground.physicsBody.contactTestBitMask = [Meteor physicsCategory];
    [self addChild: ground];
}

- (void) createCannonTower {
    CannonTower* tower = [[CannonTower alloc] init];
    tower.position = CGPointMake(80, 195);
    [self addChild: tower];
}

- (void) startMeteorRain {
    self.meteorRain = [[MeteorRain alloc] init];
    [self.meteorRain startInScene: self];
}

- (CannonTower*) cannonTower {
    return (CannonTower*) [self childNodeWithName: [CannonTower nodeName]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CannonTower* tower = self.cannonTower;
    UITouch* touch = touches.anyObject;
    CGPoint location = [touch locationInNode: self];
    [tower pointTo: location];
    [tower fireInNode: self];
}

- (void)didSimulatePhysics {
    [self enumerateChildNodesWithName: [Bullet nodeName] usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.x > self.size.width || node.position.y < 0) {
            [node removeFromParent];
        }
    }];
}

- (void)didBeginContact:(SKPhysicsContact *)contact {
    SKNode* meteor = nil;
    if ([contact.bodyA.node.name isEqualToString: [Ground nodeName]] && [contact.bodyB.node.name isEqualToString: [Meteor nodeName]]) {
        meteor = contact.bodyB.node;
    } else if ([contact.bodyA.node.name isEqualToString: [Meteor nodeName]] && [contact.bodyB.node.name isEqualToString: [Ground nodeName]]) {
        meteor = contact.bodyA.node;
    }
    
    SKAction* fade = [SKAction fadeOutWithDuration: 1.0];
    [meteor runAction: fade completion:^{
        [meteor removeFromParent];
    }];
}

@end
