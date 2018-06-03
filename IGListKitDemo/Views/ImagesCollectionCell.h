//
//  ImagesCollectionCell.h
//  IGListKitDemo
//
//  Created by gxy on 2018/5/30.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListBindable.h>
@class ImagesCollectionCellModel;
@interface ImagesCollectionCell : UICollectionViewCell<IGListBindable>
-(void)bindViewModel:(ImagesCollectionCellModel *)viewModel;
@end
