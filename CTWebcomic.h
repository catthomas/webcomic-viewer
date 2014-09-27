//
//  CTWebcomic.h
//  Webcomic-Viewer
//
//  Created by Cat Thomas on 9/27/14.
//  Copyright (c) 2014 catthomas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTWebcomic : NSObject

@property (strong) NSString *title;
@property (strong) NSString *safe_title;
@property (strong) NSNumber *num;
@property (strong) NSString *img;
@property (strong) NSString *month;
@property (strong) NSString *day;
@property (strong) NSString *year;
@property (strong) NSString *link;
@property (strong) NSString *news;
@property (strong) NSString *transcript;
@property (strong) NSString *alt;

- (id) initWithDictionary:(NSDictionary *)aDictionary;

@end
