//
//  CTWebcomicCommunicator.m
//  Webcomic-Viewer
//
//  Created by Cat Thomas on 9/27/14.
//  Copyright (c) 2014 catthomas. All rights reserved.
//

#import "CTWebcomicCommunicator.h"

@implementation CTWebcomicCommunicator

static NSString *baseURL = @"http://xkcd.com/";
static NSString *endTag = @"/info.0.json";

+ (instancetype) sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    });
    
    return sharedInstance;
}

- (void) getWebcomicWithNumber:(NSString*)num success: (void (^)(NSURLSessionDataTask *task, CTWebcomic* webcomic))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [self GET:[num stringByAppendingString:endTag] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        CTWebcomic *comic = [[CTWebcomic alloc] initWithDictionary:responseObject];
        success(task, comic);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
} //end getWebcomicWithNumber

- (void) getLatestWebcomicWithSuccess: (void (^)(NSURLSessionDataTask *task, CTWebcomic* latestWebcomic))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [self GET:endTag parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        CTWebcomic *currentComic = [[CTWebcomic alloc] initWithDictionary:responseObject];
        success(task, currentComic);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
} //end getCurrentWebComic
@end
