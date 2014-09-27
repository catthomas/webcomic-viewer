//
//  CTWebcomic.m
//  Webcomic-Viewer
//
//  Created by Cat Thomas on 9/27/14.
//  Copyright (c) 2014 catthomas. All rights reserved.
//

#import "CTWebcomic.h"

@implementation CTWebcomic

- (id) init
{
    self = [super init];
    
    if(self)
    {
        _title = @"Unkown";
        _img = @"Unknown";
        _num = @0;
    }
    
    return self;
} //end init

-(id) initWithDictionary:(NSDictionary *)aDictionary
{
    self = [self init];
    
    if(self){
        [self setValuesForKeysWithDictionary:aDictionary];
    }
    
    return self;
} //end initWithDictionary

//TODO: customize these to ignore the values i do not want
- (void) setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]){
        [self setValue:value forKey:@"ID"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (id) valueForUndefinedKey:(NSString *)key
{
    if ( [key isEqualToString:@"id"]){
        return [self valueForKey:@"ID"];
    } else{
        return [super valueForUndefinedKey:key];
    }
}
@end
