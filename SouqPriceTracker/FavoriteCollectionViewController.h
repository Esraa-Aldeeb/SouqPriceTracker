//
//  FavoriteCollectionViewController.h
//  SouqPriceTracker
//
//  Created by MAC on 4/18/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductsCollectionViewCell.h"


@interface FavoriteCollectionViewController : UICollectionViewController<ProductFavoritesDelegate>{
    
    NSMutableArray *AllData;
    
}
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;



@end
