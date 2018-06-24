//
//  CommentCollectionCell.h
//  IGListKitDemo
//
//  Created by gxy on 2018/6/6.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListBindable.h>
@class CommentCollectionCellModel;
@interface CommentCollectionCell : UICollectionViewCell<IGListBindable>
-(void)bindViewModel:(CommentCollectionCellModel *)viewModel;
@end
