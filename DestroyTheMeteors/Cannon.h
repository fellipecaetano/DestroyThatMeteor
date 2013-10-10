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

- (instancetype) init;

- (void) rotateByAngle: (CGFloat) angle;
- (void) translateTipWithVector: (CGVector) t descend: (BOOL) descend;

@end
