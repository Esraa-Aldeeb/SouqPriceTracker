//
//  ProductsCollectionViewCell.m
//  SouqPriceTracker
//
//  Created by MAC on 4/18/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "ProductsCollectionViewCell.h"

@implementation ProductsCollectionViewCell

-(void)setProductObject:(ProductObject *)productObject{
    
    
    _productObject = productObject;
   
    self.labelProductName.text =productObject.name;
    [self.imageProduct imageWithUrl:productObject.imageXL.imageUrl];
    
    
    
    if (productObject.isFavorites){
        
        [self.buttonFavorites setImage:[UIImage imageNamed:@"active_favorite"] forState:UIControlStateNormal];
    }else{
        [self.buttonFavorites setImage:[UIImage imageNamed:@"deactive_favorite"] forState:UIControlStateNormal];
        
    }
   
}


- (IBAction)addOrRemoveFavorites:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(productFavoriteButtonPressed:)]) {
        [self.delegate productFavoriteButtonPressed:_productObject];
    }

}
@end
