//
//  ChildViewController.m
//  SouqPriceTracker
//
//  Created by MAC on 4/25/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "ChildViewController.h"
#import "ProductsViewController.h"
#import "ProductsCollectionViewController.h"


@interface ChildViewController ()

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



 #pragma mark - Navigation
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 
 // Make sure your segue name in storyboard is the same as this line
 //     if (segue.identifier == "myEmbeddedSegue") {
 //    if ([[segue identifier] isEqualToString:@"goToProductionCollectionVC"])
 //    {
 //
 // Get reference to the destination view controller
 
 //        ProductsCollectionViewController *destProductionCollectionVC = segue.destinationViewController;
 //        destProductionCollectionVC.selectedProductTypes = self.selectedProductTypesInProducts;
 //        NSLog(@"%lu", destProductionCollectionVC.selectedProductTypes.count);
 //
 //        ProductsCollectionViewController *dvc = self.childViewControllers[0];
 //        dvc.selectedProductTypes = self.selectedProductTypesInProducts;
 
 //        ProductsCollectionViewController *productCollectionVC = [[ProductsCollectionViewController alloc]init];
 //        productCollectionVC.selectedProductTypes = selectedProductTypes;
 //        NSLog(@"%lu", productCollectionVC.selectedProductTypes.count);
 //
 
 
 NSString * segueName = segue.identifier;
        if ([segueName isEqualToString: @"goToProductionCollectionVC"]) {
 
 
 ProductsCollectionViewController *destViewController = segue.destinationViewController;
 // ProductsCollectionViewController * childViewController = (ProductsCollectionViewController *) [segue destinationViewController];
 destViewController.selectedProductTypes = self.selectedProductTypesInProductsInChildVC;
 NSLog(@"%lul",(unsigned long)destViewController.selectedProductTypes.count);
 NSLog(@"%lul",(unsigned long)self.selectedProductTypesInProductsInChildVC.count);
 
 // do something with the AlertView's subviews here...
 }
 
 
 // Pass any objects to the view controller here, like...
 
 }

@end
