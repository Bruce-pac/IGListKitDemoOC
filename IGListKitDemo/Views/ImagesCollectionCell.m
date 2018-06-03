//
//  ImagesCollectionCell.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/30.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "ImagesCollectionCell.h"
#import "ImageCell.h"
#import "ImagesCollectionCellModel.h"
@interface ImagesCollectionCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong) ImagesCollectionCellModel *viewModel;
@end

@implementation ImagesCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellWithReuseIdentifier:@"ImageCell"];
}

-(void)bindViewModel:(ImagesCollectionCellModel *)viewModel{
    self.viewModel = viewModel;
    [self.collectionView reloadData];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.images[indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.images.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (collectionView.bounds.size.width - 40) / 3.f;
    return CGSizeMake(width, width);
}
@end
