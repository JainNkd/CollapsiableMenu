//
//  CollapsibleCell.h
//  EnergySPOT
//
//  Created by saurabh agrawal on 08/04/14.
//  Copyright (c) 2014 ESC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollapsibleCell : NSObject
{
    NSString *key;
    NSString *title;
	NSArray *rows;
	NSInteger depth;   // Assign depth according to Collapse level 1,2,3
	BOOL open;
    CollapsibleCell __unsafe_unretained *parent;
    
    NSInteger productType;  //  type 1 for course, 2 for Categories , 3 for TEST , 4 for VIDEO, 5 for Audio 
}

@property(nonatomic, copy) NSString *key;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSArray *rows;
@property(nonatomic) NSInteger productType;
@property(nonatomic) NSInteger depth;
@property(nonatomic) BOOL open;
@property(nonatomic, unsafe_unretained)     CollapsibleCell *parent;
@end
