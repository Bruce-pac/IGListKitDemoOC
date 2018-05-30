//
//  UserInfoCell.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/24.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "UserInfoCell.h"

@interface UserInfoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation UserInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.avatarView.layer.cornerRadius = 12;
}

-(void)bindViewModel:(UserInfoCellModel *)viewModel{
    self.avatarView.backgroundColor = [UIColor purpleColor];
    self.nameLabel.text = viewModel.userName;
}

- (IBAction)clickMore:(id)sender {
    if ([self.delegate respondsToSelector:@selector(cellDidClickMore:)]) {
        [self.delegate cellDidClickMore:self];
    }
}
@end
