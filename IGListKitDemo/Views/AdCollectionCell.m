//
//  AdCollectionCell.m
//  IGListKitDemo
//
//  Created by gxy on 2018/6/25.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "AdCollectionCell.h"
#import "ADModel.h"

@interface AdCollectionCell ()
@property (weak, nonatomic) IBOutlet UIView *box;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(nonatomic,strong) UIPanGestureRecognizer *swipeGesture;
@end

@implementation AdCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)bindViewModel:(ADModel *)viewModel{
    //    [self.imageview sd_setUrl:viewModel.adUrl];
    self.titleLabel.text = viewModel.adTitle;
}

@end
