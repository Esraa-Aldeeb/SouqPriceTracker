//
//  ProductsCollectionViewController.h
//  SouqPriceTracker
//
//  Created by MAC on 4/18/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductsCollectionViewCell.h"
#import "MyDataController.h"

@interface ProductsCollectionViewController : UICollectionViewController<ProductFavoritesDelegate,UINavigationBarDelegate>{
    
    NSMutableArray *AllData;
    int selectedProductIndexPath;

    int pageNumber;
}
@property MyDataController *dataController;
@property (nonatomic)NSMutableArray *selectedProductTypes;

@property (nonatomic, strong) NSIndexPath *selectedItemIndexPath;

//@property (nonatomic,strong) NSMutableArray *selectedProductTypes;



@end
