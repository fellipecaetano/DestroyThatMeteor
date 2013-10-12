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
    [self setupPhysicsWorld];
    [self createScenario];
    [self createCannonTower];
    [self startMeteorRain];
}

- (void) setupPhysicsWorld {
    self.physicsWorld.contactDelegate = self;
    self.physicsWorld.speed = 0.7;
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

- (void) removeNode: (SKNode*) node ifItIsOutsideOfRect: (CGRect) rect {
    if (!CGRectContainsPoint(rect, node.position)) {
        [node removeFromParent];
    }
}

- (void)didSimulatePhysics {
    [self enumerateChildNodesWithName: [Bullet nodeName] usingBlock:^(SKNode *node, BOOL *stop) {
        [self removeNode: node ifItIsOutsideOfRect: self.frame];
    }];
}

- (void)didBeginContact:(SKPhysicsContact *)contact {
    SKPhysicsBody* firstBody;
    SKPhysicsBody* secondBody;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    } else {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    if (firstBody.categoryBitMask == [Bullet physicsCategory]) {
        [firstBody.node removeFromParent];
    }
    
    if (secondBody.categoryBitMask == [Bullet physicsCategory]) {
        [secondBody.node removeFromParent];
    }
    
    if (firstBody.categoryBitMask == [Meteor physicsCategory] && secondBody.categoryBitMask == [Ground physicsCategory]) {
        [firstBody.node removeFromParent];
    }
    
    if (secondBody.categoryBitMask == [Meteor physicsCategory] && firstBody.categoryBitMask == [Ground physicsCategory]) {
        [secondBody.node removeFromParent];
    }
    
    if (firstBody.categoryBitMask == [Bullet physicsCategory] && secondBody.categoryBitMask == [Meteor physicsCategory]) {
        Meteor* meteor = (Meteor*) secondBody.node;
        SKAction* explodeMeteor = [SKAction runBlock:^{
            [meteor explodeInNode: self];
            [meteor removeFromParent];
        }];
        [self runAction: explodeMeteor];
    }
    
    if (secondBody.categoryBitMask == [Bullet physicsCategory] && firstBody.categoryBitMask == [Meteor physicsCategory]) {
        Meteor* meteor = (Meteor*) firstBody.node;
        SKAction* explodeMeteor = [SKAction runBlock:^{
            [meteor explodeInNode: self];
            [meteor removeFromParent];
        }];
        [self runAction: explodeMeteor];
    }
}

@end
