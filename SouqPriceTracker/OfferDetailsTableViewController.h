//
//  OfferDetailsTableViewController.h
//  SouqPriceTracker
//
//  Created by MAC on 4/18/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductObject.h"

@interface OfferDetailsTableViewController : UITableViewController



@property (weak, nonatomic) IBOutlet UILabel *lblProductName;
@property (weak, nonatomic) IBOutlet UILabel *lblProductPrice;
@property (weak, nonatomic) IBOutlet UIButton *btnFavorites;
- (IBAction)addToFavorites:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imgProduct;


@property (nonatomic)ProductObject *productObject;

//init
-(void)addHeaderWithTitle:(NSString *)title AndIsBackButtonHidden:(BOOL)isBackButtonHidden;

// events
-(void)cancelPressed;
-(void)backArrowPressed;
- (IBAction)buyNowPressed:(id)sender;
- (IBAction)addToCartPressed:(id)sender;


@end
