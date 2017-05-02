//
//  DiamondDetails.h
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DiamondDetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *settingtype;
@property (nonatomic, strong) NSString *clarity;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *carat;
@property (nonatomic, strong) NSString *diamond;
@property (nonatomic, strong) NSString *noofdiamonds;
@property (nonatomic, strong) NSString *shape;
@property (nonatomic, strong) NSString *stoneWeight;
@property (nonatomic, strong) NSString *colorId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
