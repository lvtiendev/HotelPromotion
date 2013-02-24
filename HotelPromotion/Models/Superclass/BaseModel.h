//
//  FTModel.h
//  JanuaryApp
//
//  Created by Torin on 10/9/12.
//  Copyright (c) 2012 2359media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject <NSCoding>

- (NSString *)description;

- (id)initWithDictionary:(NSDictionary*)dict;
- (id)updateWithDictionary:(NSDictionary*)dict;
- (id)updateWithModel:(BaseModel*)newModel;
- (id)createCopy;

- (NSDictionary*)toDictionary;
- (NSDictionary*)toDictionaryUseNullValue:(BOOL)useNull;

@end
