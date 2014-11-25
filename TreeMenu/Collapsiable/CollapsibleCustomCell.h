//
//  CollapsibleCustomCell.h
//  EnergySPOT
//
//  Created by Naveen on 22/04/14.
//  Copyright (c) 2014 ESC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollapsibleCustomCell : UITableViewCell

{
    UIView *cellView;
    NSInteger *showHighlighted;
}

@property(nonatomic,strong)UIView *cellView;
@property(nonatomic,assign)NSInteger *showHighlighted;
@end
