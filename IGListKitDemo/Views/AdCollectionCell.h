//
//  AdCollectionCell.h
//  IGListKitDemo
//
//  Created by gxy on 2018/6/25.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListBindable.h>

@class ADModel;
@interface AdCollectionCell : UICollectionViewCell<IGListBindable>
-(void)bindViewModel:(id)viewModel;
@end
