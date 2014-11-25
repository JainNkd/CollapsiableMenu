//
//  CollapsibleTableViewController.m
//  EnergySPOT
//
//  Created by saurabh agrawal on 08/04/14.
//  Copyright (c) 2014 ESC. All rights reserved.
//

#import "CollapsibleTableViewController.h"
#import "CollapsibleCell.h"

@interface CollapsibleTableViewController ()

@end

@implementation CollapsibleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.bounces = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor whiteColor]; //Cell bgcolor
    
//    if([ENSUtil checkNetworkConnectivity])
//    {
//    loadingWheel  = [ENSUtil startloading];
//    if([ENSUtil isIPHONE5])
//        loadingWheel.center = CGPointMake(160,235);
//    else if([ENSUtil isIPAD])
//        loadingWheel.center = CGPointMake(384,490);
//    else
//        loadingWheel.center = CGPointMake(160,185);
//    [self.view addSubview:loadingWheel];
//    [loadingWheel startAnimating];
//    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    displayCells = [self getAllCellsInArray:collapsibleCells];
    return [displayCells count];
    //[self getRowCountsInArray:collapsibleCells];
}

//-(NSInteger) getRowCountsInArray:(NSArray *)cells {
//    NSInteger rowCount = [cells count];
//    for(CollapsibleCell *collCell in cells) {
//        if(collCell.open) {
//            rowCount += [self getRowCountsInArray:collCell.rows];
//        }
//    }
//    return rowCount;
//}

-(void) closeAllCellsInArray:(NSArray *)cells Except:(CollapsibleCell *) cell {
    for(CollapsibleCell *cellObj in cells) {
        if(!cell || (cell.key != cellObj.key)) {
            cell.open = NO;
        }
    }
}

-(void) closeAllCells:(NSArray *) cells {
    for(CollapsibleCell *cell in cells) {
        cell.open = NO;
        if(cell.rows) {
            [self closeAllCells:cell.rows];
        }
    }
}

-(NSArray *) getAllCellsInArray:(NSArray *)cells {
    NSMutableArray *allCells = [[NSMutableArray alloc] init];
//    [allCells addObjectsFromArray:cells];
    for(CollapsibleCell *cell in cells) {
        [allCells addObject:cell];
        if(cell.open) {
            [allCells addObjectsFromArray:[self getAllCellsInArray:cell.rows]];
        }
    }
    return  allCells;
}

-(void) setCellAsOpen:(CollapsibleCell *) cell {
    //close all cells
    [self closeAllCells:collapsibleCells];
    //set all the parents as open.
    [self openCell:cell];
}

-(void) openCell:(CollapsibleCell *) cell {
    cell.open = YES;
    if(cell.parent)
        [self openCell:cell.parent];
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
    
 UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil];
 [self updateTableViewCell:cell ForCollapsibleCell:[displayCells objectAtIndex:indexPath.row]];
     
 cell.backgroundColor = [UIColor clearColor];
 cell.selectionStyle = UITableViewCellSelectionStyleNone;
 // Configure the cell...
 
 return cell;
 }

//This should be overridden in the subclass
-(void) updateTableViewCell:(UITableViewCell *) cell ForCollapsibleCell:(CollapsibleCell *) collCell {
    cell.textLabel.text = collCell.title;
    cell.indentationLevel = (collCell.depth -1) * 3;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CollapsibleCell *cell = [displayCells objectAtIndex:indexPath.row];
    if(cell.open) {
        cell.open = NO;
        [self closeAllCells:cell.rows];
    } else
        [self setCellAsOpen:cell];
    //take action according to level of cell
    [self.tableView reloadData];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
