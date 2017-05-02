//
//  SizeArray.m
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SizeArray.h"


NSString *const kSizeArraySizeLabel = @"size_label";
NSString *const kSizeArraySizeValue = @"size_value";
NSString *const kSizeArraySizeStatus = @"size_status";


@interface SizeArray ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SizeArray

@synthesize sizeLabel = _sizeLabel;
@synthesize sizeValue = _sizeValue;
@synthesize sizeStatus = _sizeStatus;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.sizeLabel = [self objectOrNilForKey:kSizeArraySizeLabel fromDictionary:dict];
            self.sizeValue = [self objectOrNilForKey:kSizeArraySizeValue fromDictionary:dict];
            self.sizeStatus = [[self objectOrNilForKey:kSizeArraySizeStatus fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.sizeLabel forKey:kSizeArraySizeLabel];
    [mutableDict setValue:self.sizeValue forKey:kSizeArraySizeValue];
    [mutableDict setValue:[NSNumber numberWithBool:self.sizeStatus] forKey:kSizeArraySizeStatus];

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

    self.sizeLabel = [aDecoder decodeObjectForKey:kSizeArraySizeLabel];
    self.sizeValue = [aDecoder decodeObjectForKey:kSizeArraySizeValue];
    self.sizeStatus = [aDecoder decodeBoolForKey:kSizeArraySizeStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sizeLabel forKey:kSizeArraySizeLabel];
    [aCoder encodeObject:_sizeValue forKey:kSizeArraySizeValue];
    [aCoder encodeBool:_sizeStatus forKey:kSizeArraySizeStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    SizeArray *copy = [[SizeArray alloc] init];
    
    
    
    if (copy) {

        copy.sizeLabel = [self.sizeLabel copyWithZone:zone];
        copy.sizeValue = [self.sizeValue copyWithZone:zone];
        copy.sizeStatus = self.sizeStatus;
    }
    
    return copy;
}


@end
