//
//  CollisionDetector.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/12/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactDetection : NSObject

+ (NSDictionary*) contactTestMap;
+ (NSUInteger) contactTestBitMaskForClass: (Class) class;

@end
