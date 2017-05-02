//
//  DiamondGrades.m
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "DiamondGrades.h"


NSString *const kDiamondGradesSIGH = @"SI-GH";
NSString *const kDiamondGradesVSGH = @"VS-GH";
NSString *const kDiamondGradesVVSEF = @"VVS-EF";
NSString *const kDiamondGradesSIIJ = @"SI-IJ";


@interface DiamondGrades ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DiamondGrades

@synthesize sIGH = _sIGH;
@synthesize vSGH = _vSGH;
@synthesize vVSEF = _vVSEF;
@synthesize sIIJ = _sIIJ;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.sIGH = [[self objectOrNilForKey:kDiamondGradesSIGH fromDictionary:dict] boolValue];
            self.vSGH = [[self objectOrNilForKey:kDiamondGradesVSGH fromDictionary:dict] boolValue];
            self.vVSEF = [[self objectOrNilForKey:kDiamondGradesVVSEF fromDictionary:dict] boolValue];
            self.sIIJ = [[self objectOrNilForKey:kDiamondGradesSIIJ fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.sIGH] forKey:kDiamondGradesSIGH];
    [mutableDict setValue:[NSNumber numberWithBool:self.vSGH] forKey:kDiamondGradesVSGH];
    [mutableDict setValue:[NSNumber numberWithBool:self.vVSEF] forKey:kDiamondGradesVVSEF];
    [mutableDict setValue:[NSNumber numberWithBool:self.sIIJ] forKey:kDiamondGradesSIIJ];

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

    self.sIGH = [aDecoder decodeBoolForKey:kDiamondGradesSIGH];
    self.vSGH = [aDecoder decodeBoolForKey:kDiamondGradesVSGH];
    self.vVSEF = [aDecoder decodeBoolForKey:kDiamondGradesVVSEF];
    self.sIIJ = [aDecoder decodeBoolForKey:kDiamondGradesSIIJ];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_sIGH forKey:kDiamondGradesSIGH];
    [aCoder encodeBool:_vSGH forKey:kDiamondGradesVSGH];
    [aCoder encodeBool:_vVSEF forKey:kDiamondGradesVVSEF];
    [aCoder encodeBool:_sIIJ forKey:kDiamondGradesSIIJ];
}

- (id)copyWithZone:(NSZone *)zone {
    DiamondGrades *copy = [[DiamondGrades alloc] init];
    
    
    
    if (copy) {

        copy.sIGH = self.sIGH;
        copy.vSGH = self.vSGH;
        copy.vVSEF = self.vVSEF;
        copy.sIIJ = self.sIIJ;
    }
    
    return copy;
}


@end
