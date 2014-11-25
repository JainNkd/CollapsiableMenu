//
//  Training.m
//  EnergySPOT
//
//  Created by Divya on 16/04/14.
//  Copyright (c) 2014 ESC. All rights reserved.
//

#import "Training.h"

@implementation Training
@synthesize categories,popular;

-(Training*)getTrainingData
{
    NSMutableArray *categoriesMutArr = [[NSMutableArray alloc] init];
    for (int i=0;i<5;i++)
    {
        Categories *categoryObj =[[Categories alloc]init];
        categoryObj.categryname = [NSString stringWithFormat:@"Category %d",i+1];
        categoryObj.courseCount = i+1;
        
        NSMutableArray *coursesMutArr = [[NSMutableArray alloc] init];
        for(int j=0; j<i+1;j++)
        {
            Courses *courseObj = [[Courses alloc]init];
            courseObj.courseId = j;
            courseObj.courseCost = 10;
            courseObj.name = [NSString stringWithFormat:@"Course %ld",(long)j+1];
            [coursesMutArr addObject:courseObj];
            
        }
        categoryObj.coursesinfo = coursesMutArr;
        [categoriesMutArr addObject:categoryObj];
    }
    
    self.categories = categoriesMutArr;
    NSLog(@"categories %@",[categories description]);
    
    NSMutableArray *coursesMutArr = [[NSMutableArray alloc] init];
    for(int j=0; j<5;j++)
    {
        Courses *courseObj = [[Courses alloc]init];
        courseObj.courseId = j;
        courseObj.courseCost = 10;
        courseObj.name = [NSString stringWithFormat:@"Pop Course %ld",(long)j+1];
        [coursesMutArr addObject:courseObj];
    }
    
    NSLog(@"Populer--------------------%@",coursesMutArr);
    self.popular = coursesMutArr;
    return self;
}

@end
