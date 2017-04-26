//
//  ProductsViewController.h
//  SouqPriceTracker
//
//  Created by MAC on 4/18/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductsCollectionViewCell.h"
#import "MyDataController.h"


@interface ProductsViewController : UIViewController  {

    NSMutableArray *AllData;
    
    int pageNumber;
}
//Outlet
@property (strong, nonatomic) IBOutlet UIButton *btnSelectedProduct;
@property (strong, nonatomic) IBOutlet UIButton *btnFavoriateList;
@property (strong, nonatomic) IBOutlet UIButton *btnList;
@property (strong, nonatomic) IBOutlet UIButton *btnGrid;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) UIViewController *currentViewController;
@property (weak, nonatomic) UIViewController *currentViewControllerFavoriate;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
//
@property (nonatomic, retain) NSMutableArray *selectedProductTypesInProducts;
@property MyDataController *dataController;

//Actions
- (IBAction)listPressed:(id)sender;
- (IBAction)gridPressed:(id)sender;


@end
