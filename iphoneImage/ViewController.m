//
//  ViewController.m
//  iphoneImage
//
//  Created by Tim Beals on 2016-11-21.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://imgur.com/zdwdenZ.png"]; // 1
                  
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration]; // 2
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration]; // 3
                  
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error){
            
            if (error)
            { // 1
                NSLog(@"error: %@", error.localizedDescription);
                return;
            }
            
            NSData *data = [NSData dataWithContentsOfURL:location];
            UIImage *image = [UIImage imageWithData:data]; // 2
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                self.imageView.image = image; //4
            
            }];
    }];
                [downloadTask resume]; //5
}


@end
