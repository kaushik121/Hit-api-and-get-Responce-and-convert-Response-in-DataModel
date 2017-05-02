//
//  ColorArray.m
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ColorArray.h"


NSString *const kColorArrayColorValue = @"color_value";
NSString *const kColorArrayColorStatus = @"color_status";


@interface ColorArray ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ColorArray

@synthesize colorValue = _colorValue;
@synthesize colorStatus = _colorStatus;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.colorValue = [self objectOrNilForKey:kColorArrayColorValue fromDictionary:dict];
            self.colorStatus = [[self objectOrNilForKey:kColorArrayColorStatus fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.colorValue forKey:kColorArrayColorValue];
    [mutableDict setValue:[NSNumber numberWithBool:self.colorStatus] forKey:kColorArrayColorStatus];

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

    self.colorValue = [aDecoder decodeObjectForKey:kColorArrayColorValue];
    self.colorStatus = [aDecoder decodeBoolForKey:kColorArrayColorStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_colorValue forKey:kColorArrayColorValue];
    [aCoder encodeBool:_colorStatus forKey:kColorArrayColorStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    ColorArray *copy = [[ColorArray alloc] init];
    
    
    
    if (copy) {

        copy.colorValue = [self.colorValue copyWithZone:zone];
        copy.colorStatus = self.colorStatus;
    }
    
    return copy;
}


@end
