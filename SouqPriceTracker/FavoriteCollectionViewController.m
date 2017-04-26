//
//  FavoriteCollectionViewController.m
//  SouqPriceTracker
//
//  Created by MAC on 4/18/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "FavoriteCollectionViewController.h"
#import "OfferDetailsTableViewController.h"


@interface FavoriteCollectionViewController ()

@end


@implementation FavoriteCollectionViewController

static NSString * const reuseIdentifier = @"ProductsCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    AllData = [[DatabaseHelper sharedInstance]getFavoritesProducts];
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
}

#pragma mark <UICollectionViewDelegate>

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    cell.productObject = AllData[indexPath.row];
    cell.delegate =self;
    
    
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
    
    //[self.navigationController pushViewController:offer animated:YES];
}

#pragma mark Action

-(void)productFavoriteButtonPressed:(ProductObject *)productObject{
  
    [[DatabaseHelper sharedInstance]insertOrDeleteProductFromFavorites:productObject];
    
    productObject.isFavorites = !productObject.isFavorites;
    [AllData removeObject:productObject];
    
    [self.collectionView reloadData];}

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

@end
