//
//  categoryPage.h
//  EnergySPOT
//
//  Created by Divya on 03/04/14.
//  Copyright (c) 2014 ESC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Categories : NSObject
{
    NSString *categryname;
    int courseCount;
    NSArray *coursesinfo;
}
@property(nonatomic,copy)  NSString *categryname;
@property(nonatomic,strong)NSArray *coursesinfo;
@property(nonatomic,assign)int courseCount;

@end
