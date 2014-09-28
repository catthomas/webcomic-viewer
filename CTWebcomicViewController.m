//
//  ViewController.m
//  Webcomic-Viewer
//
//  Created by Cat Thomas on 9/27/14.
//  Copyright (c) 2014 catthomas. All rights reserved.
//
// This is the view controller for Webcomic-Viewer. It displays
// the current comic using CTWebcomicCommunicator for networking
// and implements the methods to go to the next comic as well
// as the previous comic. It uses open source code from AFNetworking
// to convert an image URL to an imageview.

#import "CTWebcomicViewController.h"
#import "AFNetworking/UIImageView+AFNetworking.h"

@interface CTWebcomicViewController ()

@end

@implementation CTWebcomicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //Set button colors
    [_prevButton setBackgroundColor:[UIColor colorWithRed:51.0f/255.0f green:102.0f/255.0f blue:153.0f/255.0f alpha:1.0f]];
    [_nextButton setBackgroundColor:[UIColor colorWithRed:51.0f/255.0f green:102.0f/255.0f blue:153.0f/255.0f alpha:1.0f]];
    
    //Set current comic to latest
    dispatch_async(dispatch_get_main_queue(), ^{
        [[CTWebcomicCommunicator sharedInstance] getLatestWebcomicWithSuccess:^(NSURLSessionDataTask *task, CTWebcomic *latestWebcomic) {
            NSLog(@"%@", latestWebcomic);
            _currentComic = latestWebcomic;
            _numberOfComics = _currentComic.num;
            //Set comic image on view
            [self setComicImageViewWithImageURL:_currentComic.img];
            _titleLabel.text = _currentComic.title;
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"There was an error: %@", error);
        }];
    });

} //end viewDidLoad

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} //end didReceiveMemoryWarning

- (IBAction)toNextComic:(id)sender
{
    dispatch_async(dispatch_get_main_queue(), ^{
    //If next comic is within bounds, display
    if ([self.currentComic.num doubleValue] <= [self.numberOfComics doubleValue]) {
        NSNumber *nextComicNumber = [NSNumber numberWithDouble:[self.currentComic.num doubleValue] + 1];
        [[CTWebcomicCommunicator sharedInstance] getWebcomicWithNumber:[nextComicNumber stringValue] success:^(NSURLSessionDataTask *task, CTWebcomic *webcomic) {
            self.currentComic = webcomic;
            
            //Set comic image on view
            [self setComicImageViewWithImageURL:self.currentComic.img];
            self.titleLabel.text = _currentComic.title;
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"There was an error: %@", error);
        }];
    }
    });
    
} //end toNextComic

- (IBAction)toPreviousComic:(id)sender
{
    //If next comic is within bounds, display
    dispatch_async(dispatch_get_main_queue(), ^{
    if ([self.currentComic.num doubleValue] > 1) {
        NSNumber *previousComicNumber = [NSNumber numberWithDouble:[self.currentComic.num doubleValue] - 1];
        [[CTWebcomicCommunicator sharedInstance] getWebcomicWithNumber:[previousComicNumber stringValue] success:^(NSURLSessionDataTask *task, CTWebcomic *webcomic) {
            self.currentComic = webcomic;
            
            //Set comic image on view
            [self setComicImageViewWithImageURL:self.currentComic.img];
            self.titleLabel.text = _currentComic.title;
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"There was an error: %@", error);
        }];
    }
    });
} //end toPreviousComic

- (void) setComicImageViewWithImageURL:(NSString*) imageURL
{
        [self.comicImageView setImageWithURL:[NSURL URLWithString:imageURL]];
}// end setComicImageViewWithImageURL
@end
