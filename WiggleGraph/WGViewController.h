//
//  WGViewController.h
//  WiggleGraph
//
//  Created by Kevin Jenkins on 7/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WGBoxyView.h"
#import "WGCurvyView.h"

@interface WGViewController : UIViewController

@property (strong, nonatomic) IBOutlet WGBoxyView *boxyView;
@property (strong, nonatomic) IBOutlet WGCurvyView *curvyView;

@end
