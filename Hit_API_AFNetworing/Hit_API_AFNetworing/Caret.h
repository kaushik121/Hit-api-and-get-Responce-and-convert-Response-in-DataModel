//
//  Caret.h
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Caret : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *caretValue;
@property (nonatomic, assign) BOOL caretStatus;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
