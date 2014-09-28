//
//  ViewController.h
//  Webcomic-Viewer
//
//  Created by Cat Thomas on 9/27/14.
//  Copyright (c) 2014 catthomas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTWebcomic.h"
#import "CTWebcomicCommunicator.h"

@interface CTWebcomicViewController : UIViewController

@property (strong) CTWebcomic *currentComic;
@property (strong) NSNumber *numberOfComics;
@property long currentComicNumber;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *comicImageView;


- (IBAction)toFirstComic:(id)sender;
- (IBAction)toLatestComic:(id)sender;
- (IBAction)toNextComic:(id)sender;
- (IBAction)toPreviousComic:(id)sender;
- (void) setComicImageViewWithImageURL:(NSString*) imageURL;
@end
