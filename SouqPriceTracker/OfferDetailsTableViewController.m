//
//  OfferDetailsTableViewController.m
//  SouqPriceTracker
//
//  Created by MAC on 4/18/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "OfferDetailsTableViewController.h"

@interface OfferDetailsTableViewController ()

@end

@implementation OfferDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
self.lblProductName.text = _productObject.name;
[self.imgProduct imageWithUrl:_productObject.imageXL.imageUrl];
self.lblProductPrice.text = [NSString stringWithFormat:@"%@ %@",_productObject.offerPrice,_productObject.currency];

[self setFavoritsImage];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - Navigation Bar

- (IBAction)backPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
//    [[self navigationController]popViewControllerAnimated:YES];

    
}

- (IBAction)searchPressed:(id)sender {
    
    //TODO add search action
}
- (IBAction)cartPressed:(id)sender {
    [AppDrawer showAlertWithTitle:nil  withMessage:[NSString stringWithFormat:@"The product with name %@ added to the cart",_productObject.productTypePluralName ]   withButton:@"Ok"];
}


#pragma  mark - Actions
- (IBAction)buyNowPressed:(id)sender {
     [AppDrawer showAlertWithTitle:nil  withMessage:[NSString stringWithFormat:@"you will buy the %@",_productObject.productTypePluralName ]   withButton:@"Ok"];
}

- (IBAction)addToCartPressed:(id)sender {
    
    [AppDrawer showAlertWithTitle:nil  withMessage:[NSString stringWithFormat:@"The product with name %@ added to the cart",_productObject.productTypePluralName ]   withButton:@"Ok"];

}

#pragma  mark - Favorites Actions
-(void)setFavoritsImage{
    
    if(_productObject.isFavorites){
        
        [self.btnFavorites setImage:[UIImage imageNamed:@"added_to_favorites"] forState:UIControlStateNormal];
    }else{
        
        [self.btnFavorites setImage:[UIImage imageNamed:@"add_to_favorites"] forState:UIControlStateNormal];
        
        
    }
}
- (IBAction)addToFavorites:(id)sender {
    [[DatabaseHelper sharedInstance]insertOrDeleteProductFromFavorites:_productObject];
    
    
    _productObject.isFavorites =! _productObject.isFavorites;
    
    
    [self setFavoritsImage];
    
    
}


@end
