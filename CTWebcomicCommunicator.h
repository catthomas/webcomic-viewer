//
//  CTWebcomicCommunicator.h
//  Webcomic-Viewer
//
//  Created by Cat Thomas on 9/27/14.
//  Copyright (c) 2014 catthomas. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "CTWebcomic.h"
@interface CTWebcomicCommunicator : AFHTTPSessionManager

+ (instancetype) sharedInstance;

- (void) getWebcomicWithNumber:(NSString*)num success: (void (^)(NSURLSessionDataTask *task, CTWebcomic* webcomic))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
- (void) getCurrentWebcomicWithSuccess: (void (^)(NSURLSessionDataTask *task, CTWebcomic* currentWebcomic))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
@end
