//
//  GameOverScene.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/14/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "GameOverScene.h"

@implementation GameOverScene

- (void)didMoveToView:(SKView *)view {
    self.backgroundColor = [SKColor colorWithRed: 135.0/255.0 green: 206.0/255.0 blue: 250.0/255.0 alpha: 1];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self createMessage];
}

- (void) createMessage {
    SKLabelNode* message = [[SKLabelNode alloc] initWithFontNamed: @"Chalkduster"];
    message.fontSize = 48;
    message.fontColor = [SKColor blackColor];
    message.text = @"Game Over! :(";
    message.position = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    [self addChild: message];
}

@end
