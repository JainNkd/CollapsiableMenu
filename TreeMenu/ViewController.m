//
//  ViewController.m
//  TreeMenu
//
//  Created by Naveen Kumar Dungarwal on 11/14/14.
//  Copyright (c) 2014 Naveen Kumar Dungarwal. All rights reserved.
//

#import "ViewController.h"
#import "Training.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Multiple Tree";
    self.view.backgroundColor = [UIColor grayColor];
    
    trainingDataObj = [[Training alloc]getTrainingData];
    
    [self setDataForUI];
    [self.tableView reloadData];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Set view data

-(void)setDataForUI{
    
    NSMutableArray *collapsibleCellMutArr = [[NSMutableArray alloc]init];
    for(int j=0;j<2;j++)
    {
        NSMutableArray *firstCellSubCellArr = [[NSMutableArray alloc]init];
        CollapsibleCell *firstLevelCell = [[CollapsibleCell alloc]init];
        firstLevelCell.key = @"category";
        firstLevelCell.depth = 1;
        firstLevelCell.open = NO;
        firstLevelCell.parent = Nil;
        firstLevelCell.productType = 0;
        
        NSArray *dataArray;
        if(j==0){
            dataArray = [[NSArray alloc]initWithArray:trainingDataObj.popular];
            firstLevelCell.title = @"Most Popular ";
            firstLevelCell.open = YES;
        }else
        {
            dataArray = [[NSArray alloc]initWithArray:trainingDataObj.categories];
            firstLevelCell.title = @"All Trainings ";
        }
        
        for(int i=0;i<[dataArray count];i++)
        {
            NSMutableArray *secondCellSubCellArr = [[NSMutableArray alloc]init];
            CollapsibleCell *secondLevelCell = [[CollapsibleCell alloc]init];
            
            if(j==0){
                Courses *courseObj = [dataArray objectAtIndex:i];
                secondLevelCell.key = [NSString stringWithFormat:@"%d",i];//course id
                secondLevelCell.productType = 4;
                secondLevelCell.title = courseObj.name;
                
                secondLevelCell.depth = 2;
                secondLevelCell.open = NO;
                secondLevelCell.parent = firstLevelCell;
            }else
            {
                Categories *categoryObj = [dataArray objectAtIndex:i];
                secondLevelCell.key = [NSString stringWithFormat:@"%d",i];
                secondLevelCell.productType = 5;
                secondLevelCell.title = categoryObj.categryname;
                
                secondLevelCell.depth = 2;
                secondLevelCell.open = NO;
                secondLevelCell.parent = firstLevelCell;
                
                for(int k=0;k<[categoryObj.coursesinfo count];k++)
                {
                    Courses *catCourseObj = [categoryObj.coursesinfo objectAtIndex:k];
                    CollapsibleCell *thirdLevelCell = [[CollapsibleCell alloc]init];
                    thirdLevelCell.key = [NSString stringWithFormat:@"%d",k];
                    thirdLevelCell.productType = 4;
                    thirdLevelCell.title = catCourseObj.name;
                    
                    thirdLevelCell.depth = 3;
                    thirdLevelCell.open = NO;
                    thirdLevelCell.parent = secondLevelCell;
                    [secondCellSubCellArr addObject:thirdLevelCell];
                }
            }
            
            
            if(j==0)
                secondLevelCell.rows = Nil;
            else
                secondLevelCell.rows = [[NSArray alloc]initWithArray:secondCellSubCellArr];
            
            //            NSLog(@"secod arr..........%d",[secondLevelCell.rows count]);
            [firstCellSubCellArr addObject:secondLevelCell];
            
        }
        firstLevelCell.rows = [[NSArray alloc]initWithArray:firstCellSubCellArr];
        NSLog(@"fir arr..........%lu",(unsigned long)[firstLevelCell.rows count]);
        [collapsibleCellMutArr addObject:firstLevelCell];
    }
    
    collapsibleCells = [[NSArray alloc]initWithArray:collapsibleCellMutArr];
    //   displayCells = [[NSArray alloc]initWithArray:collapsibleCells];
    //    NSLog(@"des....................%@.....%d",[collapsibleCells description],collapsibleCells.count);
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CollapsibleCustomCell *cell = [[CollapsibleCustomCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil];
    
    [self updateTableViewCell:cell ForCollapsibleCell:[displayCells objectAtIndex:indexPath.row]];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the cell...
    
    return cell;
}

// design table view cells
-(void) updateTableViewCell:(CollapsibleCustomCell *) cell ForCollapsibleCell:(CollapsibleCell *) collCell {
    
    //    NSLog(@"coll.....open....%d",collCell.open);
    [self viewForDepth:cell collapsibleCellObj:collCell];
}

//View For Depth 1
-(void)viewForDepth:(CollapsibleCustomCell*)cellObj collapsibleCellObj:(CollapsibleCell*)collCellObj
{
    CGRect frame;
    cellObj.cellView = [[UIView alloc]init];
    
    UIImageView *iconImageVW = [[UIImageView alloc]initWithFrame:CGRectMake(10,5,30,30)];
    [cellObj.cellView addSubview:iconImageVW];
    
    
    if(collCellObj.depth==1)
    {
        frame = CGRectMake(0,4,self.view.frame.size.width,30);
        cellObj.cellView.backgroundColor = [UIColor lightGrayColor];
        cellObj.cellView.tag=1;
        UILabel *titleLabel;
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,5,320, 20)];
        titleLabel.font=[UIFont systemFontOfSize:16.0f];
        
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = UITextAlignmentCenter;
        titleLabel.text = collCellObj.title;
        
        [cellObj.cellView addSubview:titleLabel];
        
    }
    else if(collCellObj.depth==2){
        frame = CGRectMake(10,3,self.view.frame.size.width-20,40);
        if(collCellObj.productType ==4)
            iconImageVW.image = [UIImage imageNamed:@"Course.png"];
        else
            iconImageVW.image = [UIImage imageNamed:@"Category.png"];
        
    }
    else if(collCellObj.depth==3){
        frame = CGRectMake(30,3,self.view.frame.size.width-40,40);
        iconImageVW.image = [UIImage imageNamed:@"Course.png"];
    }
    
    
    if(collCellObj.depth!=1){
        
        cellObj.cellView.backgroundColor = [UIColor whiteColor];//cell bgcolor
        cellObj.cellView.layer.borderWidth = 1;
        cellObj.cellView.layer.borderColor = [UIColor orangeColor].CGColor;//cell border color
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(45,5, 210,30)];
        titleLabel.text = collCellObj.title;
        [cellObj.cellView addSubview:titleLabel];
        
        if(collCellObj.open)
            cellObj.cellView.backgroundColor = [UIColor lightGrayColor];//Cell selection color
    }
    
    cellObj.cellView.frame = frame;
    [cellObj.contentView addSubview:cellObj.cellView];
}

//Table view delegate methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollapsibleCell *colCellObj = [displayCells objectAtIndex:indexPath.row];
    if(colCellObj.depth==1)
    {
        return 35;
    }
    else{
        return 44;
    }
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CollapsibleCell *cell = [displayCells objectAtIndex:indexPath.row];
    
    if(cell.productType==4){
        
        NSArray *courseArrObj;
        CollapsibleCell*parentCellObj = cell.parent;
        if(parentCellObj.productType==0){
            
            courseArrObj = [[NSArray alloc]initWithArray:trainingDataObj.popular];
        }else if (parentCellObj.productType==5)
        {
            NSInteger categoryIndex = [parentCellObj.key integerValue];
            Categories *categoryObj = [trainingDataObj.categories objectAtIndex:categoryIndex];
            courseArrObj = [[NSArray alloc]initWithArray:categoryObj.coursesinfo];
        }
        
        NSLog(@"course array value count .....%lu.....%@",(unsigned long)courseArrObj.count ,courseArrObj);
//        UIStoryboard *storyboard=[ENSUtil checkForIPadORIPhoneStoryBoard];
//        CoursePageViewController *mainController = [storyboard instantiateViewControllerWithIdentifier:@"CourseListView"];
//        mainController.courseArr = courseArrObj;
//        mainController.pageIndex = [cell.key integerValue];
//        
//        SharedAppDelegate.dataDictonary = nil;
//        SharedAppDelegate.dataDictonary = [[NSMutableDictionary alloc]init];
//        
//        [SharedAppDelegate.dataDictonary setValue:courseArrObj forKey:@"CourseListData"];
//        [SharedAppDelegate.dataDictonary setValue:cell.key forKey:@"SelectedCourseIndex"];
//        
//        [ENSUtil initStoryBoardWithVCObj:mainController selfViewController:self];
        
    }else{
        if(cell.open) {
            cell.open = NO;
            [self closeAllCells:cell.rows];
        } else
            [self setCellAsOpen:cell];
        //take action according to level of cell
        [self.tableView reloadData];
    }
}
@end
