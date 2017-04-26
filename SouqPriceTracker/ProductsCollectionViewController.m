//
//  ProductsCollectionViewController.m
//  SouqPriceTracker
//
//  Created by MAC on 4/18/17.
//  Copyright © 2017 MAC. All rights reserved.
//
#import "ProductsCollectionViewController.h"
#import "OfferDetailsTableViewController.h"



@interface ProductsCollectionViewController ()

@end

@implementation ProductsCollectionViewController
static NSString * const reuseIdentifier = @"ProductCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    AllData = [NSMutableArray new];
       pageNumber = 1;
    //[self getProducts:YES];
    // Do any additional setup after loading the view.
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:NO];
    [self getProducts:YES];
    
    
}
-(void)getProducts:(BOOL)withProgress{
    NSLog(@"%lu",self.dataController.selectTypesArray.count);
    self.dataController = [MyDataController sharedDataController];
    
        [AppWrapper getProductsWithPageNumber:pageNumber selectedProductTypes:self.dataController.selectTypesArray searchText:@"" withProgress:withProgress completion:^(NSMutableArray *data,int total){
        
        
        AllData = data;
        [self.collectionView reloadData];
        
        
    }];
    
    [self.collectionView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return AllData.count;
    // return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    if(AllData.count>0){
        cell.productObject = AllData[indexPath.row];
        cell.delegate =self;
    }
    
    
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"SETTING SIZE FOR ITEM AT INDEX %f", self.view.frame.size.width/2);
    CGSize mElementSize = CGSizeMake((self.view.frame.size.width/2)-10, (self.view.frame.size.width/2)-10);
    return mElementSize;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    OfferDetailsTableViewController *offer = [[OfferDetailsTableViewController alloc]init];
    offer.productObject = AllData[indexPath.row];
    //Save the selected indexPath in selectedProductIndexPath
    selectedProductIndexPath = AllData[indexPath.row];
    NSLog(@"%i",selectedProductIndexPath);
}
#pragma mark - Actions
-(void)productFavoriteButtonPressed:(ProductObject *)productObject{
    
    [[DatabaseHelper sharedInstance]insertOrDeleteProductFromFavorites:productObject];
    
    productObject.isFavorites = !productObject.isFavorites;
    [self.collectionView reloadData];
    
}

- (IBAction)addOrRemoveFavorites:(id)sender {
    
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"goToOfferDetailsFromSelectedProducts"])
    {
        //The DestinationViewController is NavigationController
        UINavigationController *navCtrl = (UINavigationController *)[segue destinationViewController];
        // Use topViewController property of the navigation controller, to access the OfferDetailsTableViewController itself
        OfferDetailsTableViewController *offerVC = (OfferDetailsTableViewController *)navCtrl.topViewController;
        offerVC.productObject = AllData[selectedProductIndexPath];
        
    }
    
}
@end
