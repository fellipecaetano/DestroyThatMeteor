//
//  Cannon.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Cannon : SKSpriteNode

@property CGFloat angle;

+ (NSString*) nodeName;

- (instancetype) init;
- (void) rotateToAngle: (CGFloat) angle;

@end
