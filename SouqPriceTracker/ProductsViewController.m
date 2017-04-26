//
//  ProductsViewController.m
//  SouqPriceTracker
//
//  Created by MAC on 4/18/17.
//  Copyright © 2017 MAC. All rights reserved.
//
#import "ChildViewController.h"
#import "FavoriteCollectionViewController.h"
#import "ProductsViewController.h"
#import "ProductsCollectionViewController.h"
#import "OfferDetailsTableViewController.h"
#import "MyDataController.h"
#import "CustomImageFlowLayout.h"

@interface ProductsViewController ()

@end

@implementation ProductsViewController
static NSString * const reuseIdentifier = @"ProductsCollectionCell";

- (void)viewDidLoad {
    [self instantiateChildOfContainerView];
    [super viewDidLoad];
   
    AllData = [NSMutableArray new];
    pageNumber = 1;
    [self setupNavigationBar];
    //[self setupInitialLayout];
    }
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];

}
/*!
 @version 1.0
 @author Esraa Aldeeb
 @brief this method is responsible for add subview and define constraint for it .
 */
#pragma  mark - Add subview
- (void)addSubview:(UIView *)subView toView:(UIView*)parentView {
    [parentView addSubview:subView];
    
    NSDictionary * views = @{@"subView" : subView,};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView]|"
                                                                   options:0
                                                                   metrics:0
                                                                     views:views];
    [parentView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView]|"
                                                          options:0
                                                          metrics:0
                                                            views:views];
    [parentView addConstraints:constraints];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*!
 @version 1.0
 @author Esraa Aldeeb
 @brief this method is responsible for define the childViewController od container view .
 */
#pragma  mark -instantiateChild
-(void)instantiateChildOfContainerView{
    
    //define the instantiate of UIViewController of UICollectionView
    self.currentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductsCollectionViewController"];
    self.currentViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addChildViewController:self.currentViewController];
    [self addSubview:self.currentViewController.view toView:self.containerView];
    
    ProductsCollectionViewController *productsCollectionVC = [[ProductsCollectionViewController alloc]init];
    self.dataController = [MyDataController sharedDataController];
    productsCollectionVC.selectedProductTypes = self.dataController.selectTypesArray;
    NSLog(@"%lu",productsCollectionVC.selectedProductTypes.count);
    NSLog(@"%lu",self.dataController.selectTypesArray.count);
    
    NSLog(@"%lu",(unsigned long)productsCollectionVC.selectedProductTypes.count);

   
}

#pragma mark SetUp initial Layout of UICollectionView
-(void)setupInitialLayout{
//    isGridFlowLayoutUsed = true
//    collectionView.collectionViewLayout = gridFlowLayout
//

}

#pragma mark - getProducts
-(void)getProducts:(BOOL)withProgress{
    NSLog(@"%lu",self.selectedProductTypesInProducts.count);
//  [AppWrapper getProductsWithPageNumber:1 selectedProductTypes:self.selectedProductTypesInProducts searchText:@"" withProgress:withProgress completion:^(NSMutableArray *data,int total){
      [AppWrapper getProductsWithPageNumber:1 selectedProductTypes:self.dataController.selectTypesArray searchText:@"" withProgress:withProgress completion:^(NSMutableArray *data,int total){
    
    
       AllData=data;
  //  AllData = @[@"product1",@"product2",@"product1",@"product2",@"product1",@"product2"];
    
    [self.collectionView reloadData];
    
    
   }];
    
    
}

#pragma mark - Navigation Bar
-(void)setupNavigationBar{
    //Navigation Bar items
    
    //Title
    UIView *customTitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 50)];
    //create your UITextField or UILabel or other view and add as subview of customTitleView
    
    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(-20, 8, 150, 30)];
    lblTitle.textColor=[UIColor whiteColor];
    lblTitle.text= @"Item Products";
    lblTitle.textAlignment= NSTextAlignmentLeft;
    
    [customTitleView addSubview:lblTitle];
    self.navigationItem.titleView = customTitleView;
    
}
- (IBAction)backPressed:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}



- (IBAction)searchPressed:(id)sender {
    
    //TODO add search action
    
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:self];
    // Use the current view controller to update the search results.
    searchController.searchResultsUpdater = self;
    // Install the search bar as the table header.
    self.navigationItem.titleView = searchController.searchBar;
    // It is usually good to set the presentation context.
    self.definesPresentationContext = YES;
        }


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return AllData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // Configure the cell
    
     cell.productObject = AllData[indexPath.row];
   // cell.labelProductName = @"productName";
    cell.delegate =self;
    
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"SETTING SIZE FOR ITEM AT INDEX %f", self.view.frame.size.width/2);
    CGSize mElementSize = CGSizeMake((self.view.frame.size.width/2)-10, (self.view.frame.size.width/2)-10);
    return mElementSize;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    OfferDetailsTableViewController *offerVC = [[OfferDetailsTableViewController alloc]init];
    offerVC.productObject = AllData[indexPath.row];
    
    [self.navigationController pushViewController:offerVC animated:YES];
}

#pragma mark - Favorite Action
-(void)productFavoriteButtonPressed:(ProductObject *)productObject{
    
    
    [[DatabaseHelper sharedInstance]insertOrDeleteProductFromFavorites:productObject];
    
    productObject.isFavorites = !productObject.isFavorites;
    
    
    
    [self.collectionView reloadData];
}
#pragma mark - Actions

- (IBAction)selectedProductPressed:(id)sender {
//    self.currentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductsCollectionViewController"];
//    self.currentViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
//    [self addChildViewController:self.currentViewController];
//    [self addSubview:self.currentViewController.view toView:self.containerView];
    
//    
    UIViewController *newViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductsCollectionViewController"];
    newViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self cycleFromViewController:self.currentViewController toViewController:newViewController];
    self.currentViewController = newViewController;
    [self.collectionView reloadData];

}
- (IBAction)favoriateListPressed:(id)sender {
//    self.currentViewControllerFavoriate = [self.storyboard instantiateViewControllerWithIdentifier:@"FavoritesCollectionViewController"];
//    self.currentViewControllerFavoriate.view.translatesAutoresizingMaskIntoConstraints = NO;
//    [self addChildViewController:self.currentViewControllerFavoriate];
//    [self addSubview:self.currentViewControllerFavoriate.view toView:self.containerView];
    
    UIViewController *newViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FavoritesCollectionViewController"];
    newViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self cycleFromViewController:self.currentViewController toViewController:newViewController];
    self.currentViewController = newViewController;
    [self.collectionView reloadData];
}
/*

- (void)cycleFromViewController: (UIViewController*) oldVC
               toViewController: (UIViewController*) newVC {
    // Prepare the two view controllers for the change.
    [oldVC willMoveToParentViewController:nil];
    [self addChildViewController:newVC];
    
    // Get the start frame of the new view controller and the end frame
    // for the old view controller. Both rectangles are offscreen.
    //SetAsComment
//    containerView.view.frame = [self newViewStartFrame];
//    CGRect endFrame = [self oldViewEndFrame];
    
    // Queue up the transition animation.
//    [self transitionFromViewController: oldVC toViewController: newVC
//                              duration: 0.25 options:0
//                            animations:^{
//                                // Animate the views to their final positions.
//                                newVC.view.frame = oldVC.view.frame;
//                                oldVC.view.frame = endFrame;
//                            }
//                            completion:^(BOOL finished) {
                                // Remove the old view controller and send the final
                                // notification to the new view controller.
                                [oldVC removeFromParentViewController];
                                [newVC didMoveToParentViewController:self];
                           // }];
}
*/

- (void)cycleFromViewController:(UIViewController*) oldViewController
               toViewController:(UIViewController*) newViewController {
    [oldViewController willMoveToParentViewController:nil];
    [self addChildViewController:newViewController];
    [self addSubview:newViewController.view toView:self.containerView];
    [newViewController.view layoutIfNeeded];
    
    // set starting state of the transition
    newViewController.view.alpha = 0;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         newViewController.view.alpha = 1;
                         oldViewController.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [oldViewController.view removeFromSuperview];
                         [oldViewController removeFromParentViewController];
                         [newViewController didMoveToParentViewController:self];
                     }];
}
- (IBAction)addOrRemoveFavorites:(id)sender {
}

- (IBAction)listPressed:(id)sender {
    
    [self.btnGrid setImage:[UIImage imageNamed:@"deactive_grid"] forState:UIControlStateNormal];
    
    [self.btnList setImage:[UIImage imageNamed:@"active_list"] forState:UIControlStateNormal];
    
   }

- (IBAction)gridPressed:(id)sender {
    //Switch the selected image between grid and list
    
    [self.btnGrid setImage:[UIImage imageNamed:@"active_grid"] forState:UIControlStateNormal];
    
    [self.btnList setImage:[UIImage imageNamed:@"deactive_list"] forState:UIControlStateNormal];
    
}
/*
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
//        if ([segueName isEqualToString: @"goToProductionCollectionVC"]) {
            if ([segueName isEqualToString: @"goToChildVC"]) {
            
    
            ProductsCollectionViewController *destViewController = segue.destinationViewController;
            ProductsCollectionViewController * childViewController = (ProductsCollectionViewController *) [segue destinationViewController];
            destViewController.selectedProductTypes = self.selectedProductTypesInProducts;
            NSLog(@"%lul",(unsigned long)destViewController.selectedProductTypes.count);
            NSLog(@"%lul",(unsigned long)self.selectedProductTypesInProducts.count);
    
    
                ///Child VC
                ChildViewController *destViewController = segue.destinationViewController;
                // ProductsCollectionViewController * childViewController = (ProductsCollectionViewController *) [segue destinationViewController];
                destViewController.selectedProductTypesInProductsInChildVC = self.selectedProductTypesInProducts;
                NSLog(@"%lu",(unsigned long)destViewController.selectedProductTypesInProductsInChildVC.count);
                NSLog(@"%lu",(unsigned long)self.selectedProductTypesInProducts.count);

            // do something with the AlertView's subviews here...
        }
    
 
        // Pass any objects to the view controller here, like...

   }
*/
@end
