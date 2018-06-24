//
//  CommentCollectionCell.m
//  IGListKitDemo
//
//  Created by gxy on 2018/6/6.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "CommentCollectionCell.h"
#import "CommentCollectionCellModel.h"
@interface CommentCollectionCell ()
@property (weak, nonatomic) IBOutlet UILabel *leftlabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@end

@implementation CommentCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)bindViewModel:(CommentCollectionCellModel *)viewModel{
    self.leftlabel.text = viewModel.person;
    self.rightLabel.text = viewModel.comment;
}
@end
