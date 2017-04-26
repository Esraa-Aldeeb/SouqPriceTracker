//
//  ProductTypesCell.m
//  SouqPriceTracker
//
//  Created by MAC on 4/15/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "ProductTypesCell.h"
#import "ProductTypeObject.h"

@implementation ProductTypesCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [_imgSelected setContentMode:UIViewContentModeScaleAspectFit];

}
-(void)setProductTypeObject:(ProductTypeObject *)productTypeObject{
    
    
    _productTypeObject = productTypeObject;
    self.lblProduct.text =productTypeObject.nameSingluar;
    
    if (productTypeObject.isSelected){
        
        self.imgSelected.hidden = NO;
        self.contaninerView.backgroundColor =  [UIColor colorWithRed:0 green:138.0f/255.0f blue:1 alpha:1.0f];
        self.lblProduct.textColor = [UIColor whiteColor];
        
    }else{
        
        self.imgSelected.hidden = YES;
        self.contaninerView.backgroundColor = [UIColor colorWithRed:242.0f/255.0f green:242.0f/255.0f blue:242.0f/255.0f alpha:1.0f];
        self.lblProduct.textColor = [UIColor blackColor];
        
        
    }
    
    
    
}


@end
