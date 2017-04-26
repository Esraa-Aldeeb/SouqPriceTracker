//
//  MyDataController.h
//  SouqPriceTracker
//
//  Created by MAC on 4/25/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDataController : NSObject
{
//NSMutableArray *selectTypesArray; // this would be the collection that you need to share
}
@property (nonatomic)NSMutableArray *selectTypesArray;
+ (MyDataController*)sharedDataController;
// ... add functions here to read / write your data
@end

