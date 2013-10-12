//
//  Soil.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/10/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface Ground : SKSpriteNode

+ (NSUInteger) physicsCategory;
+ (NSString*) nodeName;

- (instancetype) initWithWidth: (CGFloat) width;

@end
