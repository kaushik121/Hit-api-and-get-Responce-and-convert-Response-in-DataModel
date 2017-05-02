//
//  DiamondDetails.m
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "DiamondDetails.h"


NSString *const kDiamondDetailsSettingtype = @"settingtype";
NSString *const kDiamondDetailsClarity = @"clarity";
NSString *const kDiamondDetailsColor = @"color";
NSString *const kDiamondDetailsCarat = @"carat";
NSString *const kDiamondDetailsDiamond = @"diamond";
NSString *const kDiamondDetailsNoofdiamonds = @"noofdiamonds";
NSString *const kDiamondDetailsShape = @"shape";
NSString *const kDiamondDetailsStoneWeight = @"stone_weight";
NSString *const kDiamondDetailsColorId = @"color_id";


@interface DiamondDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DiamondDetails

@synthesize settingtype = _settingtype;
@synthesize clarity = _clarity;
@synthesize color = _color;
@synthesize carat = _carat;
@synthesize diamond = _diamond;
@synthesize noofdiamonds = _noofdiamonds;
@synthesize shape = _shape;
@synthesize stoneWeight = _stoneWeight;
@synthesize colorId = _colorId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.settingtype = [self objectOrNilForKey:kDiamondDetailsSettingtype fromDictionary:dict];
            self.clarity = [self objectOrNilForKey:kDiamondDetailsClarity fromDictionary:dict];
            self.color = [self objectOrNilForKey:kDiamondDetailsColor fromDictionary:dict];
            self.carat = [self objectOrNilForKey:kDiamondDetailsCarat fromDictionary:dict];
            self.diamond = [self objectOrNilForKey:kDiamondDetailsDiamond fromDictionary:dict];
            self.noofdiamonds = [self objectOrNilForKey:kDiamondDetailsNoofdiamonds fromDictionary:dict];
            self.shape = [self objectOrNilForKey:kDiamondDetailsShape fromDictionary:dict];
            self.stoneWeight = [self objectOrNilForKey:kDiamondDetailsStoneWeight fromDictionary:dict];
            self.colorId = [self objectOrNilForKey:kDiamondDetailsColorId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.settingtype forKey:kDiamondDetailsSettingtype];
    [mutableDict setValue:self.clarity forKey:kDiamondDetailsClarity];
    [mutableDict setValue:self.color forKey:kDiamondDetailsColor];
    [mutableDict setValue:self.carat forKey:kDiamondDetailsCarat];
    [mutableDict setValue:self.diamond forKey:kDiamondDetailsDiamond];
    [mutableDict setValue:self.noofdiamonds forKey:kDiamondDetailsNoofdiamonds];
    [mutableDict setValue:self.shape forKey:kDiamondDetailsShape];
    [mutableDict setValue:self.stoneWeight forKey:kDiamondDetailsStoneWeight];
    [mutableDict setValue:self.colorId forKey:kDiamondDetailsColorId];

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

    self.settingtype = [aDecoder decodeObjectForKey:kDiamondDetailsSettingtype];
    self.clarity = [aDecoder decodeObjectForKey:kDiamondDetailsClarity];
    self.color = [aDecoder decodeObjectForKey:kDiamondDetailsColor];
    self.carat = [aDecoder decodeObjectForKey:kDiamondDetailsCarat];
    self.diamond = [aDecoder decodeObjectForKey:kDiamondDetailsDiamond];
    self.noofdiamonds = [aDecoder decodeObjectForKey:kDiamondDetailsNoofdiamonds];
    self.shape = [aDecoder decodeObjectForKey:kDiamondDetailsShape];
    self.stoneWeight = [aDecoder decodeObjectForKey:kDiamondDetailsStoneWeight];
    self.colorId = [aDecoder decodeObjectForKey:kDiamondDetailsColorId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_settingtype forKey:kDiamondDetailsSettingtype];
    [aCoder encodeObject:_clarity forKey:kDiamondDetailsClarity];
    [aCoder encodeObject:_color forKey:kDiamondDetailsColor];
    [aCoder encodeObject:_carat forKey:kDiamondDetailsCarat];
    [aCoder encodeObject:_diamond forKey:kDiamondDetailsDiamond];
    [aCoder encodeObject:_noofdiamonds forKey:kDiamondDetailsNoofdiamonds];
    [aCoder encodeObject:_shape forKey:kDiamondDetailsShape];
    [aCoder encodeObject:_stoneWeight forKey:kDiamondDetailsStoneWeight];
    [aCoder encodeObject:_colorId forKey:kDiamondDetailsColorId];
}

- (id)copyWithZone:(NSZone *)zone {
    DiamondDetails *copy = [[DiamondDetails alloc] init];
    
    
    
    if (copy) {

        copy.settingtype = [self.settingtype copyWithZone:zone];
        copy.clarity = [self.clarity copyWithZone:zone];
        copy.color = [self.color copyWithZone:zone];
        copy.carat = [self.carat copyWithZone:zone];
        copy.diamond = [self.diamond copyWithZone:zone];
        copy.noofdiamonds = [self.noofdiamonds copyWithZone:zone];
        copy.shape = [self.shape copyWithZone:zone];
        copy.stoneWeight = [self.stoneWeight copyWithZone:zone];
        copy.colorId = [self.colorId copyWithZone:zone];
    }
    
    return copy;
}


@end
