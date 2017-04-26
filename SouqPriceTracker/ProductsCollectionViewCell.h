//
//  ProductsCollectionViewCell.h
//  SouqPriceTracker
//
//  Created by MAC on 4/18/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductObject.h"

@protocol ProductFavoritesDelegate<NSObject>


@required
-(void)productFavoriteButtonPressed:(ProductObject *)productObject ;


@end

@interface ProductsCollectionViewCell : UICollectionViewCell

@property (nonatomic,copy)ProductObject *productObject;
@property (nonatomic, weak) id<ProductFavoritesDelegate> delegate;
//Outlets

@property (strong, nonatomic) IBOutlet UIImageView *imageProduct;
@property (strong, nonatomic) IBOutlet UILabel *labelProductName;
@property (strong, nonatomic) IBOutlet UIButton *buttonFavorites;

//Action
- (IBAction)addOrRemoveFavorites:(id)sender;


@end
