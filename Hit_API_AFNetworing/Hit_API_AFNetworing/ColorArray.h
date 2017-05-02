//
//  ColorArray.h
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ColorArray : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *colorValue;
@property (nonatomic, assign) BOOL colorStatus;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
