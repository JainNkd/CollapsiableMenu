//
//  coursesPage.h
//  EnergySPOT
//
//  Created by Divya on 03/04/14.
//  Copyright (c) 2014 ESC. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Courses : NSObject
{
    NSString *name,*description;
    NSInteger courseId;
    NSArray *chaptersArr;
    NSInteger courseCost;
}
@property(nonatomic,copy)  NSString *name,*description;
@property(nonatomic,assign)NSInteger courseId;
@property(nonatomic,assign)NSInteger courseCost;
@property(nonatomic,strong)NSArray *chaptersArr;
@end
