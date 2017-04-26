//
//  CustomImageFlowLayout.m
//  ZDT_InstaTutorial
//
//  Created by Sztanyi Szabolcs on 13/10/15.
//  Copyright © 2015 Zappdesigntemplates. All rights reserved.
//

#import "CustomImageFlowLayout.h"

@implementation CustomImageFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.minimumLineSpacing = 1.0;
        self.minimumInteritemSpacing = 1.0;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}

- (CGSize)itemSize
{
    NSInteger numberOfColumns = 1;

    CGFloat itemWidth = (CGRectGetWidth(self.collectionView.frame) - (numberOfColumns - 1)) / numberOfColumns;
    return CGSizeMake(itemWidth, itemWidth);
}

@end
