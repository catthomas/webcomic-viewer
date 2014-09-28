//
//  ViewController.h
//  Webcomic-Viewer
//
//  Created by Cat Thomas on 9/27/14.
//  Copyright (c) 2014 catthomas. All rights reserved.
//
// This is the view controller for Webcomic-Viewer. It displays
// the current comic using CTWebcomicCommunicator for networking
// and implements the methods to go to the next comic as well
// as the previous comic.

#import <UIKit/UIKit.h>
#import "CTWebcomic.h"
#import "CTWebcomicCommunicator.h"

@interface CTWebcomicViewController : UIViewController

@property (strong) CTWebcomic *currentComic;
@property (strong) NSNumber *numberOfComics;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *comicImageView;
@property (weak, nonatomic) IBOutlet UIButton *prevButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

- (IBAction)toNextComic:(id)sender;
- (IBAction)toPreviousComic:(id)sender;
- (void) setComicImageViewWithImageURL:(NSString*) imageURL;
@end
