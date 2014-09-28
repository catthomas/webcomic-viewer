//
//  CTWebcomicCommunicator.h
//  Webcomic-Viewer
//
//  Created by Cat Thomas on 9/27/14.
//  Copyright (c) 2014 catthomas. All rights reserved.
//
// This class does the networking for Webcomic-Viewer. It implements
// methods from the open source code AFNetworking and is a subclass
// of AFHTTPSessionManager. It operates as a singleton. Currently,
// it is set up to display comics from xkcd.com.

#import "AFHTTPSessionManager.h"
#import "CTWebcomic.h"
@interface CTWebcomicCommunicator : AFHTTPSessionManager

+ (instancetype) sharedInstance;

- (void) getWebcomicWithNumber:(NSString*)num success: (void (^)(NSURLSessionDataTask *task, CTWebcomic* webcomic))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
- (void) getLatestWebcomicWithSuccess: (void (^)(NSURLSessionDataTask *task, CTWebcomic* latestWebcomic))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
@end
