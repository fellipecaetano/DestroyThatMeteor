//
//  Soil.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Ground.h"

@implementation Ground

- (instancetype)initWithWidth: (CGFloat) width {
    self = [[Ground alloc] init];
    if (self) {
        UIImage* image = [UIImage imageNamed: @"ground"];
        SKTexture* texture = [SKTexture textureWithImage: image];
        int amount = width / texture.size.width;
        int x = 0;
        
        for (int i = 0; i <= amount; i++) {
            SKSpriteNode* tile = [[SKSpriteNode alloc] initWithTexture: texture];
            tile.position = CGPointMake(x, 0);
            [self addChild: tile];
            
            x += tile.size.width;
        }
    }
    return self;
}

@end
