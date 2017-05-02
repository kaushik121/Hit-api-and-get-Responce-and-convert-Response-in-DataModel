//
//  Caret.m
//
//  Created by   on 3/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Caret.h"


NSString *const kCaretCaretValue = @"caret_value";
NSString *const kCaretCaretStatus = @"caret_status";


@interface Caret ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Caret

@synthesize caretValue = _caretValue;
@synthesize caretStatus = _caretStatus;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.caretValue = [self objectOrNilForKey:kCaretCaretValue fromDictionary:dict];
            self.caretStatus = [[self objectOrNilForKey:kCaretCaretStatus fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.caretValue forKey:kCaretCaretValue];
    [mutableDict setValue:[NSNumber numberWithBool:self.caretStatus] forKey:kCaretCaretStatus];

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

    self.caretValue = [aDecoder decodeObjectForKey:kCaretCaretValue];
    self.caretStatus = [aDecoder decodeBoolForKey:kCaretCaretStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_caretValue forKey:kCaretCaretValue];
    [aCoder encodeBool:_caretStatus forKey:kCaretCaretStatus];
}

- (id)copyWithZone:(NSZone *)zone {
    Caret *copy = [[Caret alloc] init];
    
    
    
    if (copy) {

        copy.caretValue = [self.caretValue copyWithZone:zone];
        copy.caretStatus = self.caretStatus;
    }
    
    return copy;
}


@end
