//
//  CollisionDetector.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/12/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollisionDetection : NSObject

+ (NSDictionary*) collisionMap;
+ (NSUInteger) collisionBitMaskForClass: (Class) class;

@end
