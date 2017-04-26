//
//  SplashViewController.m
//  SouqPriceTracker
//
//  Created by MAC on 4/12/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end
@implementation SplashViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
//Animate Splash Logo
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.imgSplashLogo.alpha = 1;
//                         self.imgSplashLogo.center = CGPointMake(self.imgSplashLogo.center.x, self.imgSplashLogo.center.y - 100);
                         CGRect frame           = self.imgSplashLogo.frame;
                         frame.origin.y         = 30;
                         self.imgSplashLogo.frame = frame;
                     }
                     completion:^(BOOL finished){
    
                     [self performSegueWithIdentifier:@"splashTologin" sender:self];
                     }];

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

@end
