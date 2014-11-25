//
//  Training.h
//  EnergySPOT
//
//  Created by Divya on 16/04/14.
//  Copyright (c) 2014 ESC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Categories.h"
#import "Courses.h"
@interface Training : NSObject

{
    NSArray *categories;
    NSArray *popular;
}
@property(nonatomic,strong)NSArray *categories;
@property(nonatomic,strong)NSArray *popular;

-(Training*)getTrainingData;;
@end
