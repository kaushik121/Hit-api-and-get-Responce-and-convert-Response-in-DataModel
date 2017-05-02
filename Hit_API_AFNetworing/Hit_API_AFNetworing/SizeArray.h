//
//  SizeArray.h
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SizeArray : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *sizeLabel;
@property (nonatomic, strong) NSString *sizeValue;
@property (nonatomic, assign) BOOL sizeStatus;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
