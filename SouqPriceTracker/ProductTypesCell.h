//
//  ProductTypesCell.h
//  SouqPriceTracker
//
//  Created by MAC on 4/15/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductTypeObject.h"

@interface ProductTypesCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *contaninerView;
@property (strong, nonatomic) IBOutlet UILabel *lblProduct;
@property (strong, nonatomic) IBOutlet UIImageView *imgSelected;
@property (nonatomic,copy)ProductTypeObject *productTypeObject;


@end
