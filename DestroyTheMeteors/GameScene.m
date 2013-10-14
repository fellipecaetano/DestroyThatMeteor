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
#import "Score.h"
#import "GameOverScene.h"

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
    [self createScore];
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

- (void) createScore {
    Score* score = [[Score alloc] init];
    score.position = CGPointMake(35, self.size.height - 90);
    [self addChild: score];
}

- (void) startMeteorRain {
    self.meteorRain = [[MeteorRain alloc] init];
    [self.meteorRain startInScene: self];
}

- (CannonTower*) cannonTower {
    return (CannonTower*) [self childNodeWithName: [CannonTower nodeName]];
}

- (Score*) score {
    return (Score*) [self childNodeWithName: [Score nodeName]];
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

- (void) meteor: (Meteor*) meteor collidedWithNode: (SKNode*) node {
    SKAction* explodeMeteor = [SKAction runBlock:^{
        [meteor explodeInNode: self];
        [meteor removeFromParent];
    }];
    
    [self runAction: explodeMeteor];
    
    if ([CannonTower hasTheSameNameAsNode: node]) {
        SKAction* explodeTower = [SKAction runBlock:^{
            [self.cannonTower explodeInNode: self];
            [self.cannonTower removeFromParent];
        }];
        
        [self runAction: explodeTower];
        [self gameOver];
    }
}

- (void) bullet: (Bullet*) bullet collidedWithNode: (SKNode*) node {
    [bullet removeFromParent];
    
    if ([Meteor hasTheSameNameAsNode: node]) {
        [self.score incrementByAmount: 1];
    }
}

- (void)didBeginContact:(SKPhysicsContact *)contact {
    if (contact.bodyA.categoryBitMask == [Bullet physicsCategory]) {
        Bullet* bullet = (Bullet*) contact.bodyA.node;
        [self bullet: bullet collidedWithNode: contact.bodyB.node];
    }
    
    if (contact.bodyB.categoryBitMask == [Bullet physicsCategory]) {
        Bullet* bullet = (Bullet*) contact.bodyB.node;
        [self bullet: bullet collidedWithNode: contact.bodyA.node];
    }
    
    if (contact.bodyA.categoryBitMask == [Meteor physicsCategory]) {
        Meteor* meteor = (Meteor*) contact.bodyA.node;
        [self meteor: meteor collidedWithNode: contact.bodyB.node];
    }
    
    if (contact.bodyB.categoryBitMask == [Meteor physicsCategory]) {
        Meteor* meteor = (Meteor*) contact.bodyB.node;
        [self meteor: meteor collidedWithNode: contact.bodyA.node];
    }
}

- (void) gameOver {
    SKAction* wait = [SKAction waitForDuration: 2.5];
    SKAction* changeScene = [SKAction runBlock:^{
        GameOverScene* scene = [[GameOverScene alloc] initWithSize: self.size];
        SKTransition* transition = [SKTransition doorsCloseHorizontalWithDuration: 0.4];
        [self.view presentScene: scene transition: transition];
    }];
    
    [self runAction: [SKAction sequence: @[ wait, changeScene ]]];
}

@end
