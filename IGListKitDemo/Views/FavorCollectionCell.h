//
//  FavorCollectionCell.h
//  IGListKitDemo
//
//  Created by gxy on 2018/6/3.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListBindable.h>

@class FavorCollectionCellModel;
@interface FavorCollectionCell : UICollectionViewCell<IGListBindable>
-(void)bindViewModel:(FavorCollectionCellModel *)viewModel;
@end
