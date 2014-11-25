//
//  ViewController.h
//  TreeMenu
//
//  Created by Naveen Kumar Dungarwal on 11/14/14.
//  Copyright (c) 2014 Naveen Kumar Dungarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollapsibleTableViewController.h"
#import "CollapsibleCell.h"
#import "CollapsibleCustomCell.h"

@class Training;

@interface ViewController : CollapsibleTableViewController
{
    Training *trainingDataObj;
}

@end

