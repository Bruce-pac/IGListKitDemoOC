//
//  UserInfoCell.h
//  IGListKitDemo
//
//  Created by gxy on 2018/5/24.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit.h>
#import "UserInfoCellModel.h"

@class UserInfoCell;
@protocol UserInfoCellDelegate <NSObject>

- (void)cellDidClickMore:(UserInfoCell *)cell;

@end

@interface UserInfoCell : UICollectionViewCell<IGListBindable>
@property(nonatomic,weak) id<UserInfoCellDelegate> delegate;
-(void)bindViewModel:(UserInfoCellModel *)viewModel;
@end
