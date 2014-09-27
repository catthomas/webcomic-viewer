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
@property (strong) NSNumber *num;
@property (strong) NSString *img;

- (id) initWithDictionary:(NSDictionary *)aDictionary;

@end
