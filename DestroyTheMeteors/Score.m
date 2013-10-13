//
//  Score.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/13/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Score.h"

@implementation Score

- (instancetype)init {
    self = [super init];
    if (self) {
        SKColor* color = [SKColor blackColor];
        NSString* font = @"Chalkduster";
        
        SKLabelNode* label = [self createLabelWithColor: color font: font];
        SKLabelNode* score = [self createScoreWithColor: color font: font];
        
        [self addChild: label];
        [self addChild: score];
    }
    return self;
}

- (SKLabelNode*) createLabelWithColor: (SKColor*) color font: (NSString*) font {
    SKLabelNode* label = [[SKLabelNode alloc] initWithFontNamed: font];
    label.fontSize = 14;
    label.text = @"Score: ";
    label.fontColor = color;
    label.position = CGPointMake(0, 32);
    label.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    return label;
}

- (SKLabelNode*) createScoreWithColor: (SKColor*) color font: (NSString*) font {
    SKLabelNode* score = [[SKLabelNode alloc] initWithFontNamed: font];
    score.fontSize = 32;
    score.text = @"0";
    score.fontColor = color;
    score.position = CGPointMake(0, 0);
    score.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    return score;
}

@end
