//
//  DiamondBreakup.h
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DiamondBreakup : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *diamondValue;
@property (nonatomic, strong) NSString *diamondWeight;
@property (nonatomic, strong) NSString *diamondRate;
@property (nonatomic, strong) NSString *diamondComponent;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
