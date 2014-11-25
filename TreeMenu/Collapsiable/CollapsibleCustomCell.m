//
//  CollapsibleCustomCell.m
//  EnergySPOT
//
//  Created by Naveen on 22/04/14.
//  Copyright (c) 2014 ESC. All rights reserved.
//

#import "CollapsibleCustomCell.h"


@implementation CollapsibleCustomCell
@synthesize cellView,showHighlighted;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if(selected)
        self.cellView.backgroundColor = [UIColor lightGrayColor];
    //    else
    //        self.cellView.backgroundColor = [UIColor whiteColor];
    // Configure the view for the selected state
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    if(highlighted && (cellView.tag!=1))
        self.cellView.backgroundColor = [UIColor lightGrayColor];
    //    else
    //        self.cellView.backgroundColor = [UIColor whiteColor];
}

@end
