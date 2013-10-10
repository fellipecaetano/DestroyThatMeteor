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

static NSString* TOWER_NODE = @"tower";

@implementation GameScene

- (void)didMoveToView:(SKView *)view {
    self.backgroundColor = [SKColor whiteColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self createScenario];
    [self createCannonTower];
}

- (void) createScenario {
    Ground* ground = [[Ground alloc] initWithWidth: self.size.width];
    ground.position = CGPointMake(0, 64);
    [self addChild: ground];
}

- (void) createCannonTower {
    CannonTower* tower = [[CannonTower alloc] init];
    tower.name = TOWER_NODE;
    tower.position = CGPointMake(80, 195);
    [self addChild: tower];
}

- (CannonTower*) cannonTower {
    return (CannonTower*) [self childNodeWithName: TOWER_NODE];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CannonTower* tower = self.cannonTower;
    UITouch* touch = touches.anyObject;
    CGPoint location = [touch locationInNode: self];
    [tower pointTo: location];
}

@end
