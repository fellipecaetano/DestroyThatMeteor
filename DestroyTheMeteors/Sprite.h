//
//  Sprite.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/14/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Sprite : SKSpriteNode

+ (NSString*) nodeName;
+ (NSUInteger) physicsCategory;
+ (BOOL) hasTheSameNameAsNode: (SKNode*) node;

@end
