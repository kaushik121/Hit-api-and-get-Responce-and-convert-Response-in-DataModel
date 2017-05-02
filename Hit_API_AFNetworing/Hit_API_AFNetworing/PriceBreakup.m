//
//  PriceBreakup.m
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "PriceBreakup.h"
#import "ColorstoneDetails.h"
#import "GemstoneBreakup.h"
#import "DiamondBreakup.h"


NSString *const kPriceBreakupColorstoneAmount = @"colorstone_amount";
NSString *const kPriceBreakupVat = @"vat";
NSString *const kPriceBreakupMakingCharges = @"making_charges";
NSString *const kPriceBreakupGoldComponent = @"gold_component";
NSString *const kPriceBreakupColorstoneDetails = @"colorstone_details";
NSString *const kPriceBreakupGoldValue = @"gold_value";
NSString *const kPriceBreakupGoldWeight = @"gold_weight";
NSString *const kPriceBreakupTotal = @"total";
NSString *const kPriceBreakupGemstoneBreakup = @"gemstone_breakup";
NSString *const kPriceBreakupDiamondBreakup = @"diamond_breakup";
NSString *const kPriceBreakupGoldRate = @"gold_rate";


@interface PriceBreakup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PriceBreakup

@synthesize colorstoneAmount = _colorstoneAmount;
@synthesize vat = _vat;
@synthesize makingCharges = _makingCharges;
@synthesize goldComponent = _goldComponent;
@synthesize colorstoneDetails = _colorstoneDetails;
@synthesize goldValue = _goldValue;
@synthesize goldWeight = _goldWeight;
@synthesize total = _total;
@synthesize gemstoneBreakup = _gemstoneBreakup;
@synthesize diamondBreakup = _diamondBreakup;
@synthesize goldRate = _goldRate;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.colorstoneAmount = [self objectOrNilForKey:kPriceBreakupColorstoneAmount fromDictionary:dict];
            self.vat = [self objectOrNilForKey:kPriceBreakupVat fromDictionary:dict];
            self.makingCharges = [self objectOrNilForKey:kPriceBreakupMakingCharges fromDictionary:dict];
            self.goldComponent = [self objectOrNilForKey:kPriceBreakupGoldComponent fromDictionary:dict];
            self.colorstoneDetails = [ColorstoneDetails modelObjectWithDictionary:[dict objectForKey:kPriceBreakupColorstoneDetails]];
            self.goldValue = [self objectOrNilForKey:kPriceBreakupGoldValue fromDictionary:dict];
            self.goldWeight = [self objectOrNilForKey:kPriceBreakupGoldWeight fromDictionary:dict];
            self.total = [self objectOrNilForKey:kPriceBreakupTotal fromDictionary:dict];
            self.gemstoneBreakup = [GemstoneBreakup modelObjectWithDictionary:[dict objectForKey:kPriceBreakupGemstoneBreakup]];
    NSObject *receivedDiamondBreakup = [dict objectForKey:kPriceBreakupDiamondBreakup];
    NSMutableArray *parsedDiamondBreakup = [NSMutableArray array];
    
    if ([receivedDiamondBreakup isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDiamondBreakup) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDiamondBreakup addObject:[DiamondBreakup modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDiamondBreakup isKindOfClass:[NSDictionary class]]) {
       [parsedDiamondBreakup addObject:[DiamondBreakup modelObjectWithDictionary:(NSDictionary *)receivedDiamondBreakup]];
    }

    self.diamondBreakup = [NSArray arrayWithArray:parsedDiamondBreakup];
            self.goldRate = [self objectOrNilForKey:kPriceBreakupGoldRate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.colorstoneAmount forKey:kPriceBreakupColorstoneAmount];
    [mutableDict setValue:self.vat forKey:kPriceBreakupVat];
    [mutableDict setValue:self.makingCharges forKey:kPriceBreakupMakingCharges];
    [mutableDict setValue:self.goldComponent forKey:kPriceBreakupGoldComponent];
    [mutableDict setValue:[self.colorstoneDetails dictionaryRepresentation] forKey:kPriceBreakupColorstoneDetails];
    [mutableDict setValue:self.goldValue forKey:kPriceBreakupGoldValue];
    [mutableDict setValue:self.goldWeight forKey:kPriceBreakupGoldWeight];
    [mutableDict setValue:self.total forKey:kPriceBreakupTotal];
    [mutableDict setValue:[self.gemstoneBreakup dictionaryRepresentation] forKey:kPriceBreakupGemstoneBreakup];
    NSMutableArray *tempArrayForDiamondBreakup = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.diamondBreakup) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDiamondBreakup addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDiamondBreakup addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDiamondBreakup] forKey:kPriceBreakupDiamondBreakup];
    [mutableDict setValue:self.goldRate forKey:kPriceBreakupGoldRate];

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

    self.colorstoneAmount = [aDecoder decodeObjectForKey:kPriceBreakupColorstoneAmount];
    self.vat = [aDecoder decodeObjectForKey:kPriceBreakupVat];
    self.makingCharges = [aDecoder decodeObjectForKey:kPriceBreakupMakingCharges];
    self.goldComponent = [aDecoder decodeObjectForKey:kPriceBreakupGoldComponent];
    self.colorstoneDetails = [aDecoder decodeObjectForKey:kPriceBreakupColorstoneDetails];
    self.goldValue = [aDecoder decodeObjectForKey:kPriceBreakupGoldValue];
    self.goldWeight = [aDecoder decodeObjectForKey:kPriceBreakupGoldWeight];
    self.total = [aDecoder decodeObjectForKey:kPriceBreakupTotal];
    self.gemstoneBreakup = [aDecoder decodeObjectForKey:kPriceBreakupGemstoneBreakup];
    self.diamondBreakup = [aDecoder decodeObjectForKey:kPriceBreakupDiamondBreakup];
    self.goldRate = [aDecoder decodeObjectForKey:kPriceBreakupGoldRate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_colorstoneAmount forKey:kPriceBreakupColorstoneAmount];
    [aCoder encodeObject:_vat forKey:kPriceBreakupVat];
    [aCoder encodeObject:_makingCharges forKey:kPriceBreakupMakingCharges];
    [aCoder encodeObject:_goldComponent forKey:kPriceBreakupGoldComponent];
    [aCoder encodeObject:_colorstoneDetails forKey:kPriceBreakupColorstoneDetails];
    [aCoder encodeObject:_goldValue forKey:kPriceBreakupGoldValue];
    [aCoder encodeObject:_goldWeight forKey:kPriceBreakupGoldWeight];
    [aCoder encodeObject:_total forKey:kPriceBreakupTotal];
    [aCoder encodeObject:_gemstoneBreakup forKey:kPriceBreakupGemstoneBreakup];
    [aCoder encodeObject:_diamondBreakup forKey:kPriceBreakupDiamondBreakup];
    [aCoder encodeObject:_goldRate forKey:kPriceBreakupGoldRate];
}

- (id)copyWithZone:(NSZone *)zone {
    PriceBreakup *copy = [[PriceBreakup alloc] init];
    
    
    
    if (copy) {

        copy.colorstoneAmount = [self.colorstoneAmount copyWithZone:zone];
        copy.vat = [self.vat copyWithZone:zone];
        copy.makingCharges = [self.makingCharges copyWithZone:zone];
        copy.goldComponent = [self.goldComponent copyWithZone:zone];
        copy.colorstoneDetails = [self.colorstoneDetails copyWithZone:zone];
        copy.goldValue = [self.goldValue copyWithZone:zone];
        copy.goldWeight = [self.goldWeight copyWithZone:zone];
        copy.total = [self.total copyWithZone:zone];
        copy.gemstoneBreakup = [self.gemstoneBreakup copyWithZone:zone];
        copy.diamondBreakup = [self.diamondBreakup copyWithZone:zone];
        copy.goldRate = [self.goldRate copyWithZone:zone];
    }
    
    return copy;
}


@end
