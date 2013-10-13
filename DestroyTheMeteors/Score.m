//
//  Score.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/13/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Score.h"

static NSString* SCORE_VALUE_NODE = @"value";

@implementation Score

- (instancetype)init {
    self = [super init];
    if (self) {
        SKColor* color = [SKColor blackColor];
        NSString* font = @"Chalkduster";
        
        SKLabelNode* label = [self createLabelWithColor: color font: font];
        SKLabelNode* value = [self createScoreWithColor: color font: font];
        
        [self addChild: label];
        [self addChild: value];
        
        self.value = 0;
        self.name = [self.class nodeName];
    }
    return self;
}

+ (NSString *)nodeName {
    return @"score";
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
    score.fontColor = color;
    score.position = CGPointMake(0, 0);
    score.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    score.name = SCORE_VALUE_NODE;
    return score;
}

- (NSInteger)value {
    SKLabelNode* valueNode = (SKLabelNode*) [self childNodeWithName: SCORE_VALUE_NODE];
    return valueNode.text.integerValue;
}

- (void)setValue:(NSInteger)value {
    SKLabelNode* valueNode = (SKLabelNode*) [self childNodeWithName: SCORE_VALUE_NODE];
    valueNode.text = @(value).stringValue;
}

- (void)incrementByAmount:(NSInteger)increment {
    self.value = self.value + increment;
}

- (void)decrementByAmount:(NSInteger)decrement {
    self.value = self.value - decrement;
}

@end
