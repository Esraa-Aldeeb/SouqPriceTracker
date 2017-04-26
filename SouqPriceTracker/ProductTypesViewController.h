//
//  ProductTypesViewController.h
//  SouqPriceTracker
//
//  Created by MAC on 4/13/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductTypesCell.h"
#import "ProductsCollectionViewController.h"
#import "CCBottomRefreshControl/UIScrollView+BottomRefreshControl.h"

@interface ProductTypesViewController : UIViewController <UITableViewDelegate , UITableViewDataSource>
{

    NSMutableArray *AllProductTypes;
    UIRefreshControl *refreshControl;
    int pageNumber,totalTypes;
    UIActivityIndicatorView *activityView;

}
//Outlets
@property (nonatomic)NSMutableArray *selectedProductTypes;
@property (strong, nonatomic) IBOutlet UITableView *dataTableView;
@property (strong, nonatomic) IBOutlet UIButton *btnGo;

//init
-(void)addHeaderWithTitle:(NSString *)title AndIsBackButtonHidden:(BOOL)isBackButtonHidden;

// events
-(void)cancelPressed;
-(void)backArrowPressed;
//Action
- (IBAction)goTapped:(id)sender;



@end
