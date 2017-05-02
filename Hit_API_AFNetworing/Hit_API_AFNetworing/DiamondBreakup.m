//
//  DiamondBreakup.m
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "DiamondBreakup.h"


NSString *const kDiamondBreakupDiamondValue = @"diamond_value";
NSString *const kDiamondBreakupDiamondWeight = @"diamond_weight";
NSString *const kDiamondBreakupDiamondRate = @"diamond_rate";
NSString *const kDiamondBreakupDiamondComponent = @"diamond_component";


@interface DiamondBreakup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DiamondBreakup

@synthesize diamondValue = _diamondValue;
@synthesize diamondWeight = _diamondWeight;
@synthesize diamondRate = _diamondRate;
@synthesize diamondComponent = _diamondComponent;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.diamondValue = [self objectOrNilForKey:kDiamondBreakupDiamondValue fromDictionary:dict];
            self.diamondWeight = [self objectOrNilForKey:kDiamondBreakupDiamondWeight fromDictionary:dict];
            self.diamondRate = [self objectOrNilForKey:kDiamondBreakupDiamondRate fromDictionary:dict];
            self.diamondComponent = [self objectOrNilForKey:kDiamondBreakupDiamondComponent fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.diamondValue forKey:kDiamondBreakupDiamondValue];
    [mutableDict setValue:self.diamondWeight forKey:kDiamondBreakupDiamondWeight];
    [mutableDict setValue:self.diamondRate forKey:kDiamondBreakupDiamondRate];
    [mutableDict setValue:self.diamondComponent forKey:kDiamondBreakupDiamondComponent];

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

    self.diamondValue = [aDecoder decodeObjectForKey:kDiamondBreakupDiamondValue];
    self.diamondWeight = [aDecoder decodeObjectForKey:kDiamondBreakupDiamondWeight];
    self.diamondRate = [aDecoder decodeObjectForKey:kDiamondBreakupDiamondRate];
    self.diamondComponent = [aDecoder decodeObjectForKey:kDiamondBreakupDiamondComponent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_diamondValue forKey:kDiamondBreakupDiamondValue];
    [aCoder encodeObject:_diamondWeight forKey:kDiamondBreakupDiamondWeight];
    [aCoder encodeObject:_diamondRate forKey:kDiamondBreakupDiamondRate];
    [aCoder encodeObject:_diamondComponent forKey:kDiamondBreakupDiamondComponent];
}

- (id)copyWithZone:(NSZone *)zone {
    DiamondBreakup *copy = [[DiamondBreakup alloc] init];
    
    
    
    if (copy) {

        copy.diamondValue = [self.diamondValue copyWithZone:zone];
        copy.diamondWeight = [self.diamondWeight copyWithZone:zone];
        copy.diamondRate = [self.diamondRate copyWithZone:zone];
        copy.diamondComponent = [self.diamondComponent copyWithZone:zone];
    }
    
    return copy;
}


@end
