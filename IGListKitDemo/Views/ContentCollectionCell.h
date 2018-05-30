//
//  ContentCollectionCell.h
//  IGListKitDemo
//
//  Created by gxy on 2018/5/28.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListBindable.h>
@interface ContentCollectionCell : UICollectionViewCell<IGListBindable>
-(void)bindViewModel:(NSString *)viewModel;
+ (CGFloat)lineHeight;
+ (CGFloat)heightWithText:(NSString *)text width:(CGFloat)width;
@end
