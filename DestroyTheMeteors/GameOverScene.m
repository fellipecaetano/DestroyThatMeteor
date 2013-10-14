//
//  GameOverScene.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/14/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "GameOverScene.h"
#import "GameScene.h"

static NSString* FONT = @"Chalkduster";

@implementation GameOverScene

- (void)didMoveToView:(SKView *)view {
    self.backgroundColor = [SKColor colorWithRed: 135.0/255.0 green: 206.0/255.0 blue: 250.0/255.0 alpha: 1];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self createMessage];
}

- (void) createMessage {
    SKLabelNode* mainMessage = [[SKLabelNode alloc] initWithFontNamed: @"Chalkduster"];
    mainMessage.fontSize = 48;
    mainMessage.fontColor = [SKColor blackColor];
    mainMessage.text = @"Game Over! :(";
    mainMessage.position = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) + 32);
    [self addChild: mainMessage];
    
    SKLabelNode* startAgainMessage = [[SKLabelNode alloc] initWithFontNamed: @"Chalkduster"];
    startAgainMessage.fontSize = 20;
    startAgainMessage.fontColor = [SKColor blackColor];
    startAgainMessage.text = @"Tap the screen to try again.";
    startAgainMessage.position = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) - 32);
    [self addChild: startAgainMessage];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    SKAction* changeScene = [SKAction runBlock:^{
        GameScene* scene = [[GameScene alloc] initWithSize: self.size];
        SKTransition* transition = [SKTransition doorsOpenHorizontalWithDuration: 0.4];
        [self.view presentScene: scene transition: transition];
    }];
    
    [self runAction: changeScene];
}

@end
