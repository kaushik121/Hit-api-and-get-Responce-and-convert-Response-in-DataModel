//
//  Data.h
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GemstoneDetails, PriceBreakup;

@interface ProductDetailDataModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *blackBeadsWeight;
@property (nonatomic, strong) NSArray *diamondGrades;
@property (nonatomic, strong) NSString *categoryId;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *wishlistId;
@property (nonatomic, strong) NSArray *colorArray;
@property (nonatomic, strong) NSArray *caret;
@property (nonatomic, strong) NSString *productName;
@property (nonatomic, strong) NSString *vatCst;
@property (nonatomic, strong) NSString *inCart;
@property (nonatomic, strong) GemstoneDetails *gemstoneDetails;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *length;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *metal;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, strong) NSArray *sizeArray;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *approximateMetalWeight;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *productDescription;
@property (nonatomic, strong) NSArray *diamondDetails;
@property (nonatomic, strong) NSString *isFevorite;
@property (nonatomic, strong) NSString *gold;
@property (nonatomic, strong) NSString *diamond;
@property (nonatomic, strong) NSString *makingCharges;
@property (nonatomic, strong) NSString *productCode;
@property (nonatomic, strong) NSString *totalPrice;
@property (nonatomic, strong) PriceBreakup *priceBreakup;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
