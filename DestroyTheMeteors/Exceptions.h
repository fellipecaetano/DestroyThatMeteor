//
//  Exceptions.h
//  DestroyTheMeteors
//
//  Created by Fellipe Caetano on 10/14/13.
//  Copyright (c) 2013 Dextra Sistemas. All rights reserved.
//

#ifndef DestroyTheMeteors_Exceptions_h
#define DestroyTheMeteors_Exceptions_h

#define NOT_IMPLEMENTED @throw [NSException exceptionWithName: @"MethodNotImplemented" reason: [NSString stringWithFormat: @"Did not implement %@", NSStringFromSelector(_cmd)] userInfo: nil];

#endif
