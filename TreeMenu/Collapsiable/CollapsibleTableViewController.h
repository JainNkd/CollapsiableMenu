//
//  CollapsibleTableViewController.h
//  EnergySPOT
//
//  Created by saurabh agrawal on 08/04/14.
//  Copyright (c) 2014 ESC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollapsibleCell.h"

@class ENSUtil;
@interface CollapsibleTableViewController : UITableViewController
{
    NSArray *collapsibleCells;
    NSArray *displayCells;
    UIActivityIndicatorView *loadingWheel;
}

-(void) closeAllCells:(NSArray *) cells;
-(void) closeAllCellsInArray:(NSArray *)cells Except:(CollapsibleCell *) cell;
-(void) setCellAsOpen:(CollapsibleCell *) cell;
-(void) openCell:(CollapsibleCell *) cell;

-(NSArray *) getAllCellsInArray:(NSArray *)cells ;
@end
