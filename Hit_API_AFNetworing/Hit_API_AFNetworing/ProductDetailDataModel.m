//
//  Data.m
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ProductDetailDataModel.h"
#import "DiamondGrades.h"
#import "ColorArray.h"
#import "Caret.h"
#import "GemstoneDetails.h"
#import "SizeArray.h"
#import "DiamondDetails.h"
#import "PriceBreakup.h"


NSString *const kDataBlackBeadsWeight = @"black_beads_weight";
NSString *const kDataDiamondGrades = @"diamond_grades";
NSString *const kDataCategoryId = @"category_id";
NSString *const kDataImage = @"image";
NSString *const kDataWishlistId = @"wishlist_id";
NSString *const kDataColorArray = @"color_array";
NSString *const kDataCaret = @"caret";
NSString *const kDataProductName = @"product_name";
NSString *const kDataVatCst = @"vat_cst";
NSString *const kDataInCart = @"inCart";
NSString *const kDataGemstoneDetails = @"gemstone_details";
NSString *const kDataImages = @"images";
NSString *const kDataSize = @"size";
NSString *const kDataLength = @"length";
NSString *const kDataProductId = @"product_id";
NSString *const kDataMetal = @"metal";
NSString *const kDataShortDescription = @"short_description";
NSString *const kDataSizeArray = @"size_array";
NSString *const kDataHeight = @"height";
NSString *const kDataApproximateMetalWeight = @"approximate_metal_weight";
NSString *const kDataWidth = @"width";
NSString *const kDataProductDescription = @"product_description";
NSString *const kDataDiamondDetails = @"diamond_details";
NSString *const kDataIsFevorite = @"isFevorite";
NSString *const kDataGold = @"gold";
NSString *const kDataDiamond = @"diamond";
NSString *const kDataMakingCharges = @"making_charges";
NSString *const kDataProductCode = @"product_code";
NSString *const kDataTotalPrice = @"total_price";
NSString *const kDataPriceBreakup = @"price_breakup";


@interface ProductDetailDataModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProductDetailDataModel

@synthesize blackBeadsWeight = _blackBeadsWeight;
@synthesize diamondGrades = _diamondGrades;
@synthesize categoryId = _categoryId;
@synthesize image = _image;
@synthesize wishlistId = _wishlistId;
@synthesize colorArray = _colorArray;
@synthesize caret = _caret;
@synthesize productName = _productName;
@synthesize vatCst = _vatCst;
@synthesize inCart = _inCart;
@synthesize gemstoneDetails = _gemstoneDetails;
@synthesize images = _images;
@synthesize size = _size;
@synthesize length = _length;
@synthesize productId = _productId;
@synthesize metal = _metal;
@synthesize shortDescription = _shortDescription;
@synthesize sizeArray = _sizeArray;
@synthesize height = _height;
@synthesize approximateMetalWeight = _approximateMetalWeight;
@synthesize width = _width;
@synthesize productDescription = _productDescription;
@synthesize diamondDetails = _diamondDetails;
@synthesize isFevorite = _isFevorite;
@synthesize gold = _gold;
@synthesize diamond = _diamond;
@synthesize makingCharges = _makingCharges;
@synthesize productCode = _productCode;
@synthesize totalPrice = _totalPrice;
@synthesize priceBreakup = _priceBreakup;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.blackBeadsWeight = [self objectOrNilForKey:kDataBlackBeadsWeight fromDictionary:dict];
    NSObject *receivedDiamondGrades = [dict objectForKey:kDataDiamondGrades];
    NSMutableArray *parsedDiamondGrades = [NSMutableArray array];
    
    if ([receivedDiamondGrades isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDiamondGrades) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDiamondGrades addObject:[DiamondGrades modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDiamondGrades isKindOfClass:[NSDictionary class]]) {
       [parsedDiamondGrades addObject:[DiamondGrades modelObjectWithDictionary:(NSDictionary *)receivedDiamondGrades]];
    }

    self.diamondGrades = [NSArray arrayWithArray:parsedDiamondGrades];
            self.categoryId = [self objectOrNilForKey:kDataCategoryId fromDictionary:dict];
            self.image = [self objectOrNilForKey:kDataImage fromDictionary:dict];
            self.wishlistId = [self objectOrNilForKey:kDataWishlistId fromDictionary:dict];
    NSObject *receivedColorArray = [dict objectForKey:kDataColorArray];
    NSMutableArray *parsedColorArray = [NSMutableArray array];
    
    if ([receivedColorArray isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedColorArray) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedColorArray addObject:[ColorArray modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedColorArray isKindOfClass:[NSDictionary class]]) {
       [parsedColorArray addObject:[ColorArray modelObjectWithDictionary:(NSDictionary *)receivedColorArray]];
    }

    self.colorArray = [NSArray arrayWithArray:parsedColorArray];
    NSObject *receivedCaret = [dict objectForKey:kDataCaret];
    NSMutableArray *parsedCaret = [NSMutableArray array];
    
    if ([receivedCaret isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCaret) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCaret addObject:[Caret modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCaret isKindOfClass:[NSDictionary class]]) {
       [parsedCaret addObject:[Caret modelObjectWithDictionary:(NSDictionary *)receivedCaret]];
    }

    self.caret = [NSArray arrayWithArray:parsedCaret];
            self.productName = [self objectOrNilForKey:kDataProductName fromDictionary:dict];
            self.vatCst = [self objectOrNilForKey:kDataVatCst fromDictionary:dict];
            self.inCart = [self objectOrNilForKey:kDataInCart fromDictionary:dict];
            self.gemstoneDetails = [GemstoneDetails modelObjectWithDictionary:[dict objectForKey:kDataGemstoneDetails]];
            self.images = [self objectOrNilForKey:kDataImages fromDictionary:dict];
            self.size = [self objectOrNilForKey:kDataSize fromDictionary:dict];
            self.length = [self objectOrNilForKey:kDataLength fromDictionary:dict];
            self.productId = [self objectOrNilForKey:kDataProductId fromDictionary:dict];
            self.metal = [self objectOrNilForKey:kDataMetal fromDictionary:dict];
            self.shortDescription = [self objectOrNilForKey:kDataShortDescription fromDictionary:dict];
    NSObject *receivedSizeArray = [dict objectForKey:kDataSizeArray];
    NSMutableArray *parsedSizeArray = [NSMutableArray array];
    
    if ([receivedSizeArray isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSizeArray) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSizeArray addObject:[SizeArray modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSizeArray isKindOfClass:[NSDictionary class]]) {
       [parsedSizeArray addObject:[SizeArray modelObjectWithDictionary:(NSDictionary *)receivedSizeArray]];
    }

    self.sizeArray = [NSArray arrayWithArray:parsedSizeArray];
            self.height = [self objectOrNilForKey:kDataHeight fromDictionary:dict];
            self.approximateMetalWeight = [self objectOrNilForKey:kDataApproximateMetalWeight fromDictionary:dict];
            self.width = [self objectOrNilForKey:kDataWidth fromDictionary:dict];
            self.productDescription = [self objectOrNilForKey:kDataProductDescription fromDictionary:dict];
    NSObject *receivedDiamondDetails = [dict objectForKey:kDataDiamondDetails];
    NSMutableArray *parsedDiamondDetails = [NSMutableArray array];
    
    if ([receivedDiamondDetails isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDiamondDetails) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDiamondDetails addObject:[DiamondDetails modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDiamondDetails isKindOfClass:[NSDictionary class]]) {
       [parsedDiamondDetails addObject:[DiamondDetails modelObjectWithDictionary:(NSDictionary *)receivedDiamondDetails]];
    }

    self.diamondDetails = [NSArray arrayWithArray:parsedDiamondDetails];
            self.isFevorite = [self objectOrNilForKey:kDataIsFevorite fromDictionary:dict];
            self.gold = [self objectOrNilForKey:kDataGold fromDictionary:dict];
            self.diamond = [self objectOrNilForKey:kDataDiamond fromDictionary:dict];
            self.makingCharges = [self objectOrNilForKey:kDataMakingCharges fromDictionary:dict];
            self.productCode = [self objectOrNilForKey:kDataProductCode fromDictionary:dict];
            self.totalPrice = [self objectOrNilForKey:kDataTotalPrice fromDictionary:dict];
            self.priceBreakup = [PriceBreakup modelObjectWithDictionary:[dict objectForKey:kDataPriceBreakup]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.blackBeadsWeight forKey:kDataBlackBeadsWeight];
    NSMutableArray *tempArrayForDiamondGrades = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.diamondGrades) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDiamondGrades addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDiamondGrades addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDiamondGrades] forKey:kDataDiamondGrades];
    [mutableDict setValue:self.categoryId forKey:kDataCategoryId];
    [mutableDict setValue:self.image forKey:kDataImage];
    [mutableDict setValue:self.wishlistId forKey:kDataWishlistId];
    NSMutableArray *tempArrayForColorArray = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.colorArray) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForColorArray addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForColorArray addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForColorArray] forKey:kDataColorArray];
    NSMutableArray *tempArrayForCaret = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.caret) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCaret addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCaret addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCaret] forKey:kDataCaret];
    [mutableDict setValue:self.productName forKey:kDataProductName];
    [mutableDict setValue:self.vatCst forKey:kDataVatCst];
    [mutableDict setValue:self.inCart forKey:kDataInCart];
    [mutableDict setValue:[self.gemstoneDetails dictionaryRepresentation] forKey:kDataGemstoneDetails];
    NSMutableArray *tempArrayForImages = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.images) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImages addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImages addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImages] forKey:kDataImages];
    [mutableDict setValue:self.size forKey:kDataSize];
    [mutableDict setValue:self.length forKey:kDataLength];
    [mutableDict setValue:self.productId forKey:kDataProductId];
    [mutableDict setValue:self.metal forKey:kDataMetal];
    [mutableDict setValue:self.shortDescription forKey:kDataShortDescription];
    NSMutableArray *tempArrayForSizeArray = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.sizeArray) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSizeArray addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSizeArray addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSizeArray] forKey:kDataSizeArray];
    [mutableDict setValue:self.height forKey:kDataHeight];
    [mutableDict setValue:self.approximateMetalWeight forKey:kDataApproximateMetalWeight];
    [mutableDict setValue:self.width forKey:kDataWidth];
    [mutableDict setValue:self.productDescription forKey:kDataProductDescription];
    NSMutableArray *tempArrayForDiamondDetails = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.diamondDetails) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDiamondDetails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDiamondDetails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDiamondDetails] forKey:kDataDiamondDetails];
    [mutableDict setValue:self.isFevorite forKey:kDataIsFevorite];
    [mutableDict setValue:self.gold forKey:kDataGold];
    [mutableDict setValue:self.diamond forKey:kDataDiamond];
    [mutableDict setValue:self.makingCharges forKey:kDataMakingCharges];
    [mutableDict setValue:self.productCode forKey:kDataProductCode];
    [mutableDict setValue:self.totalPrice forKey:kDataTotalPrice];
    [mutableDict setValue:[self.priceBreakup dictionaryRepresentation] forKey:kDataPriceBreakup];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.blackBeadsWeight = [aDecoder decodeObjectForKey:kDataBlackBeadsWeight];
    self.diamondGrades = [aDecoder decodeObjectForKey:kDataDiamondGrades];
    self.categoryId = [aDecoder decodeObjectForKey:kDataCategoryId];
    self.image = [aDecoder decodeObjectForKey:kDataImage];
    self.wishlistId = [aDecoder decodeObjectForKey:kDataWishlistId];
    self.colorArray = [aDecoder decodeObjectForKey:kDataColorArray];
    self.caret = [aDecoder decodeObjectForKey:kDataCaret];
    self.productName = [aDecoder decodeObjectForKey:kDataProductName];
    self.vatCst = [aDecoder decodeObjectForKey:kDataVatCst];
    self.inCart = [aDecoder decodeObjectForKey:kDataInCart];
    self.gemstoneDetails = [aDecoder decodeObjectForKey:kDataGemstoneDetails];
    self.images = [aDecoder decodeObjectForKey:kDataImages];
    self.size = [aDecoder decodeObjectForKey:kDataSize];
    self.length = [aDecoder decodeObjectForKey:kDataLength];
    self.productId = [aDecoder decodeObjectForKey:kDataProductId];
    self.metal = [aDecoder decodeObjectForKey:kDataMetal];
    self.shortDescription = [aDecoder decodeObjectForKey:kDataShortDescription];
    self.sizeArray = [aDecoder decodeObjectForKey:kDataSizeArray];
    self.height = [aDecoder decodeObjectForKey:kDataHeight];
    self.approximateMetalWeight = [aDecoder decodeObjectForKey:kDataApproximateMetalWeight];
    self.width = [aDecoder decodeObjectForKey:kDataWidth];
    self.productDescription = [aDecoder decodeObjectForKey:kDataProductDescription];
    self.diamondDetails = [aDecoder decodeObjectForKey:kDataDiamondDetails];
    self.isFevorite = [aDecoder decodeObjectForKey:kDataIsFevorite];
    self.gold = [aDecoder decodeObjectForKey:kDataGold];
    self.diamond = [aDecoder decodeObjectForKey:kDataDiamond];
    self.makingCharges = [aDecoder decodeObjectForKey:kDataMakingCharges];
    self.productCode = [aDecoder decodeObjectForKey:kDataProductCode];
    self.totalPrice = [aDecoder decodeObjectForKey:kDataTotalPrice];
    self.priceBreakup = [aDecoder decodeObjectForKey:kDataPriceBreakup];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_blackBeadsWeight forKey:kDataBlackBeadsWeight];
    [aCoder encodeObject:_diamondGrades forKey:kDataDiamondGrades];
    [aCoder encodeObject:_categoryId forKey:kDataCategoryId];
    [aCoder encodeObject:_image forKey:kDataImage];
    [aCoder encodeObject:_wishlistId forKey:kDataWishlistId];
    [aCoder encodeObject:_colorArray forKey:kDataColorArray];
    [aCoder encodeObject:_caret forKey:kDataCaret];
    [aCoder encodeObject:_productName forKey:kDataProductName];
    [aCoder encodeObject:_vatCst forKey:kDataVatCst];
    [aCoder encodeObject:_inCart forKey:kDataInCart];
    [aCoder encodeObject:_gemstoneDetails forKey:kDataGemstoneDetails];
    [aCoder encodeObject:_images forKey:kDataImages];
    [aCoder encodeObject:_size forKey:kDataSize];
    [aCoder encodeObject:_length forKey:kDataLength];
    [aCoder encodeObject:_productId forKey:kDataProductId];
    [aCoder encodeObject:_metal forKey:kDataMetal];
    [aCoder encodeObject:_shortDescription forKey:kDataShortDescription];
    [aCoder encodeObject:_sizeArray forKey:kDataSizeArray];
    [aCoder encodeObject:_height forKey:kDataHeight];
    [aCoder encodeObject:_approximateMetalWeight forKey:kDataApproximateMetalWeight];
    [aCoder encodeObject:_width forKey:kDataWidth];
    [aCoder encodeObject:_productDescription forKey:kDataProductDescription];
    [aCoder encodeObject:_diamondDetails forKey:kDataDiamondDetails];
    [aCoder encodeObject:_isFevorite forKey:kDataIsFevorite];
    [aCoder encodeObject:_gold forKey:kDataGold];
    [aCoder encodeObject:_diamond forKey:kDataDiamond];
    [aCoder encodeObject:_makingCharges forKey:kDataMakingCharges];
    [aCoder encodeObject:_productCode forKey:kDataProductCode];
    [aCoder encodeObject:_totalPrice forKey:kDataTotalPrice];
    [aCoder encodeObject:_priceBreakup forKey:kDataPriceBreakup];
}

- (id)copyWithZone:(NSZone *)zone {
    ProductDetailDataModel *copy = [[ProductDetailDataModel alloc] init];
    
    
    
    if (copy) {

        copy.blackBeadsWeight = [self.blackBeadsWeight copyWithZone:zone];
        copy.diamondGrades = [self.diamondGrades copyWithZone:zone];
        copy.categoryId = [self.categoryId copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.wishlistId = [self.wishlistId copyWithZone:zone];
        copy.colorArray = [self.colorArray copyWithZone:zone];
        copy.caret = [self.caret copyWithZone:zone];
        copy.productName = [self.productName copyWithZone:zone];
        copy.vatCst = [self.vatCst copyWithZone:zone];
        copy.inCart = [self.inCart copyWithZone:zone];
        copy.gemstoneDetails = [self.gemstoneDetails copyWithZone:zone];
        copy.images = [self.images copyWithZone:zone];
        copy.size = [self.size copyWithZone:zone];
        copy.length = [self.length copyWithZone:zone];
        copy.productId = [self.productId copyWithZone:zone];
        copy.metal = [self.metal copyWithZone:zone];
        copy.shortDescription = [self.shortDescription copyWithZone:zone];
        copy.sizeArray = [self.sizeArray copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
        copy.approximateMetalWeight = [self.approximateMetalWeight copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.productDescription = [self.productDescription copyWithZone:zone];
        copy.diamondDetails = [self.diamondDetails copyWithZone:zone];
        copy.isFevorite = [self.isFevorite copyWithZone:zone];
        copy.gold = [self.gold copyWithZone:zone];
        copy.diamond = [self.diamond copyWithZone:zone];
        copy.makingCharges = [self.makingCharges copyWithZone:zone];
        copy.productCode = [self.productCode copyWithZone:zone];
        copy.totalPrice = [self.totalPrice copyWithZone:zone];
        copy.priceBreakup = [self.priceBreakup copyWithZone:zone];
    }
    
    return copy;
}


@end
