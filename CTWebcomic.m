//
//  CTWebcomic.m
//  Webcomic-Viewer
//
//  Created by Cat Thomas on 9/27/14.
//  Copyright (c) 2014 catthomas. All rights reserved.
//
// This class is representative of a single Webcomic.
// It's properties are modeled after the comic data
// for webcomics found on xkcd.com.

#import "CTWebcomic.h"

@implementation CTWebcomic

- (id) init
{
    self = [super init];
    
    if(self)
    {
        _title = @"Unknown";
        _safe_title = @"Unknown";
        _img = @"Unknown";
        _num = @0;
        _img = @"Unknown";
        _month = @"Unknown";
        _day = @"Unknown";
        _year = @"Unknown";
        _link = @"Unknown";
        _news = @"Unknown";
        _transcript = @"Unknown";
        _alt = @"Unknown";
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
@end
