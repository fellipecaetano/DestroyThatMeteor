//
//  Soil.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Ground.h"
#import "ContactDetector.h"

@implementation Ground

- (instancetype)initWithWidth: (CGFloat) width {
    self = [[Ground alloc] initWithColor: [SKColor clearColor] size: CGSizeMake(width * 2, 128)];
    if (self) {
        UIImage* image = [UIImage imageNamed: @"ground"];
        SKTexture* texture = [SKTexture textureWithImage: image];
        NSInteger amount = width / texture.size.width;
        NSInteger x = 0;
        
        for (NSInteger i = 0; i <= amount; i++) {
            SKSpriteNode* tile = [[SKSpriteNode alloc] initWithTexture: texture];
            tile.position = CGPointMake(x, 0);
            [self addChild: tile];
            
            x += tile.size.width;
        }
        
        self.name = [self.class nodeName];
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.size];
        self.physicsBody.dynamic = NO;
        self.physicsBody.categoryBitMask = [self.class physicsCategory];
        self.physicsBody.contactTestBitMask = [ContactDetector contactTestBitMaskForClass: self.class];
    }
    return self;
}

+ (NSString *)nodeName {
    return @"ground";
}

+ (NSUInteger) physicsCategory {
    return 0x1 << 0;
}

@end
