//
//  FavorCollectionCell.m
//  IGListKitDemo
//
//  Created by gxy on 2018/6/3.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "FavorCollectionCell.h"
#import "FavorCollectionCellModel.h"

#define GBKeyPath(objc, keyPath) @(((void)objc.keyPath, #keyPath))

@interface FavorCollectionCell ()
@property (weak, nonatomic) IBOutlet UIButton *favorBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property(nonatomic,strong) FavorCollectionCellModel *viewModel;
@end

@implementation FavorCollectionCell

-(void)dealloc{
    [self.viewModel removeObserver:self forKeyPath:GBKeyPath(self.viewModel, favorNum)];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)bindViewModel:(FavorCollectionCellModel *)viewModel{
    self.viewModel = viewModel;
    [self.viewModel addObserver:self forKeyPath:GBKeyPath(self.viewModel, favorNum) options:NSKeyValueObservingOptionNew context:nil];
    self.favorBtn.selected = viewModel.isFavor;
    self.nameLabel.text = viewModel.favorNum;
}

- (IBAction)btnDidClick:(UIButton *)sender {
    self.favorBtn.selected = !sender.isSelected;
    self.viewModel.isFavor = self.favorBtn.selected;
    if (self.viewModel.favorBlock) {
        self.viewModel.favorBlock(self.viewModel.isFavor);
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:GBKeyPath(self.viewModel, favorNum)]) {
        NSString *favorNum = change[NSKeyValueChangeNewKey];
        self.nameLabel.text = favorNum;
    }
}

@end
