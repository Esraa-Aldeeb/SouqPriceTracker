//
//  ProductTypesViewController.m
//  SouqPriceTracker
//
//  Created by MAC on 4/13/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "ProductTypesViewController.h"
#import "ProductsViewController.h"

@interface ProductTypesViewController ()

@end

@implementation ProductTypesViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    //Add ActivityIndicatorView
   activityView=[[UIActivityIndicatorView alloc]init];
    [self.view addSubview:activityView];
    activityView.center=CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);

    AllProductTypes = [NSMutableArray new];
    //Initial Value
    totalTypes = 0;
    pageNumber = 1;
    //add refresh control at the bottom of UITableView
    refreshControl = [UIRefreshControl new];
    refreshControl.triggerVerticalOffset = 100.;
    [refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    self.dataTableView.bottomRefreshControl = refreshControl;
    //Call Actions
    [self setupNavigationBar];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    [self getProductTypes:YES];

    
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:NO];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark - NavigationBar

- (IBAction)cancelPressed:(id)sender {
    NSLog(@"CancelPressed");
    
}
-(void)setupNavigationBar{
    //Navigation Bar items
    //Logo
    UIImageView *imgSouqLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"souq_logo"]];
    [imgSouqLogo setContentMode:UIViewContentModeScaleAspectFit];
    imgSouqLogo.frame = CGRectMake(0, 0, 35, 35);
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:imgSouqLogo];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
    //Title
    UIView *customTitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 50)];
    //create your UITextField or UILabel or other view and add as subview of customTitleView
    
    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(-20, 8, 150, 30)];
    lblTitle.textColor=[UIColor whiteColor];
    lblTitle.text= @"Product types";
    lblTitle.textAlignment= NSTextAlignmentLeft;
    
    [customTitleView addSubview:lblTitle];
    self.navigationItem.titleView = customTitleView;
    
}


#pragma  mark - GetProductsTypesFromDatabase

-(void)getProductTypes:(BOOL)withProgress{
    
    [AppWrapper getProductTypesWithPageNumber:pageNumber withProgress:withProgress  completion:^(NSMutableArray *data,int total){
        //Activity Indicator
        
        [activityView startAnimating];
        totalTypes = total;
        [AllProductTypes addObjectsFromArray:data];
        [self.dataTableView reloadData];
        [refreshControl endRefreshing];
        
        
    }];
    [activityView stopAnimating];

    
}
#pragma  mark - statusBar Style
- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


#pragma  mark - Filter Products

-(NSMutableArray *)filterSelectedProducts{
    
    
    NSMutableArray *selectedProductTypesFromProducts = [NSMutableArray new];
    
    for (ProductTypeObject *productType in AllProductTypes){
        
        
        if (productType.isSelected)
            [selectedProductTypesFromProducts addObject:productType];
    }
    
    return selectedProductTypesFromProducts;
    
}
#pragma  mark - Action
- (IBAction)goTapped:(id)sender {
    
    
    NSMutableArray *selectedProductTypes =[self filterSelectedProducts];
    
    if (selectedProductTypes.count>0){
        ProductsViewController *productsVC = [[ProductsViewController alloc]init];
        
        productsVC.selectedProductTypesInProducts = selectedProductTypes;
        MyDataController *dataController = [MyDataController sharedDataController];
        dataController.selectTypesArray =selectedProductTypes;
        NSLog(@"%lu",(unsigned long)dataController.selectTypesArray.count);
        [self performSegueWithIdentifier:@"goToProductItems" sender:self];
        ;
    }else{
        
        [AppDrawer showAlertWithTitle:@"No Product Types Selected" withMessage:@"please select at least one product type"   withButton:@"Ok"];
    }
    
    
    
}

#pragma  mark - UITableView Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return AllProductTypes.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    ProductTypesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductTypesCell"];
    
    
    if (!cell)
        cell = [[ProductTypesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProductTypesCell"];
    
    
    cell.productTypeObject = AllProductTypes[indexPath.row];
    // cell.lblProduct.text= @"Test";
    
    return cell;
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ProductTypeObject *productType =  AllProductTypes[indexPath.row];
    
    productType.isSelected = !productType.isSelected;
    
    [self.dataTableView reloadData];
}
#pragma  mark - ScrollView
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (([scrollView contentOffset].y + scrollView.frame.size.height) >= [scrollView contentSize].height){
        
        // Get new record from here
        
        
        
    }
}
- (void)refresh {
    // Do refresh stuff here
    
    if (AllProductTypes.count!=totalTypes){
        
        pageNumber+=1;
        [self getProductTypes:NO];
        
        
    }else{
        
        [refreshControl endRefreshing];
    }
}
/*
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
 
     // Make sure your segue name in storyboard is the same as this line
     if ([[segue identifier] isEqualToString:@"goToProductItems"])
     {
     // Get reference to the destination view controller
     
     ProductsViewController *destViewController = segue.destinationViewController;
     destViewController.selectedProductTypesInProducts = self.selectedProductTypes;
     NSLog(@"%lu", destViewController.selectedProductTypesInProducts.count);
     
     //        ProductsCollectionViewController *productCollectionVC = [[ProductsCollectionViewController alloc]init];
     //        productCollectionVC.selectedProductTypes = selectedProductTypes;
     //        NSLog(@"%lu", productCollectionVC.selectedProductTypes.count);
     //
     
     
     
     // Pass any objects to the view controller here, like...
     }
 
    
}
*/

@end
