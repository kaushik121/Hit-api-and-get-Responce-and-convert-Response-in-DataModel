//
//  PriceBreakup.h
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ColorstoneDetails, GemstoneBreakup;

@interface PriceBreakup : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *colorstoneAmount;
@property (nonatomic, strong) NSString *vat;
@property (nonatomic, strong) NSString *makingCharges;
@property (nonatomic, strong) NSString *goldComponent;
@property (nonatomic, strong) ColorstoneDetails *colorstoneDetails;
@property (nonatomic, strong) NSString *goldValue;
@property (nonatomic, strong) NSString *goldWeight;
@property (nonatomic, strong) NSString *total;
@property (nonatomic, strong) GemstoneBreakup *gemstoneBreakup;
@property (nonatomic, strong) NSArray *diamondBreakup;
@property (nonatomic, strong) NSString *goldRate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
