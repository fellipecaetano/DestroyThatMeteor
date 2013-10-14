//
//  Sprite.m
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/14/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#import "Sprite.h"
#import "Exceptions.h"

@implementation Sprite

+ (NSString *)nodeName {
    NOT_IMPLEMENTED;
}

+ (NSUInteger)physicsCategory {
    NOT_IMPLEMENTED;
}

+ (BOOL)hasTheSameNameAsNode:(SKNode *)node {
    return [node.name isEqualToString: self.nodeName];
}

@end
