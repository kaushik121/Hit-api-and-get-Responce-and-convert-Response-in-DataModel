//
//  DiamondGrades.h
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DiamondGrades : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL sIGH;
@property (nonatomic, assign) BOOL vSGH;
@property (nonatomic, assign) BOOL vVSEF;
@property (nonatomic, assign) BOOL sIIJ;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
