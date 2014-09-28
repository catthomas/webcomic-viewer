//
//  ViewController.m
//  Webcomic-Viewer
//
//  Created by Cat Thomas on 9/27/14.
//  Copyright (c) 2014 catthomas. All rights reserved.
//

#import "CTWebcomicViewController.h"
#import "AFNetworking/UIImageView+AFNetworking.h"

@interface CTWebcomicViewController ()

@end

@implementation CTWebcomicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Set current comic to latest
    [[CTWebcomicCommunicator sharedInstance] getLatestWebcomicWithSuccess:^(NSURLSessionDataTask *task, CTWebcomic *currentWebcomic) {
        _currentComic = currentWebcomic; //set current comic
        _numberOfComics = _currentComic.num; //set total number of comics
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"There was an error: %@", error);
    }];
    
    //Set comic image on view
    [self setComicImageViewWithImageURL:_currentComic.img];
} //end viewDidLoad

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} //end didReceiveMemoryWarning

- (IBAction)toFirstComic:(id)sender
{
    [[CTWebcomicCommunicator sharedInstance] getWebcomicWithNumber:@"1" success:^(NSURLSessionDataTask *task, CTWebcomic *webcomic) {
        self.currentComic = webcomic;
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"There was an error: %@", error);
    }];
    
    //Set comic image on view
    [self setComicImageViewWithImageURL:self.currentComic.img];
} //end toFirstComic

- (IBAction)toLatestComic:(id)sender
{
    [[CTWebcomicCommunicator sharedInstance] getLatestWebcomicWithSuccess:^(NSURLSessionDataTask *task, CTWebcomic *latestWebcomic) {
        self.currentComic = latestWebcomic; //set current comic
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"There was an error: %@", error);
    }];
    
    //Set comic image on view
    [self setComicImageViewWithImageURL:self.currentComic.img];
} //end toLatestComic

- (IBAction)toNextComic:(id)sender
{
    NSNumber *nextComicNumber = [NSNumber numberWithDouble:[self.currentComic.num doubleValue] + 1];
    
    //If next comic is within bounds, display
    if ([nextComicNumber doubleValue] <= [self.numberOfComics doubleValue]) {
        [[CTWebcomicCommunicator sharedInstance] getWebcomicWithNumber:[nextComicNumber stringValue] success:^(NSURLSessionDataTask *task, CTWebcomic *webcomic) {
            self.currentComic = webcomic;
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"There was an error: %@", error);
        }];
        
        //Set comic image on view
        [self setComicImageViewWithImageURL:self.currentComic.img];
    }
    
} //end toNextComic

- (IBAction)toPreviousComic:(id)sender
{
    NSNumber *previousComicNumber = [NSNumber numberWithDouble:[self.currentComic.num doubleValue] - 1];
    
    //If next comic is within bounds, display
    if ([previousComicNumber doubleValue] > 0) {
        [[CTWebcomicCommunicator sharedInstance] getWebcomicWithNumber:[previousComicNumber stringValue] success:^(NSURLSessionDataTask *task, CTWebcomic *webcomic) {
            self.currentComic = webcomic;
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"There was an error: %@", error);
        }];
        
        //Set comic image on view
        [self setComicImageViewWithImageURL:self.currentComic.img];
    }
} //end toPreviousComic

- (void) setComicImageViewWithImageURL:(NSString*) imageURL
{
    NSLog(@"%@", imageURL);
    [self.comicImageView setImageWithURL:[NSURL URLWithString:imageURL]];
}// end setComicImageViewWithImageURL
@end
