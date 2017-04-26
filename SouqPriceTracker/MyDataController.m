//
//  MyDataController.m
//  SouqPriceTracker
//
//  Created by MAC on 4/25/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "MyDataController.h"
static MyDataController* sharedDataController; // this will be unique and contain your data

@implementation MyDataController
+ (MyDataController*)sharedDataController
{
    if (!sharedDataController)
        sharedDataController = [[MyDataController alloc] init];
    return sharedDataController;
}

@end
