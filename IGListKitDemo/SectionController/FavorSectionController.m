//
//  FavorSectionController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/6/3.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "FavorSectionController.h"
#import "FavorCollectionCell.h"
#import "FeedModel.h"
#import "FavorCollectionCellModel.h"
@interface FavorSectionController ()
@property(nonatomic,strong) FeedModel *object;
@property(nonatomic,strong) FavorCollectionCellModel *viewModel;
@end

@implementation FavorSectionController
-(NSInteger)numberOfItems{
    return 1;
}

-(CGSize)sizeForItemAtIndex:(NSInteger)index{
    return CGSizeMake(self.collectionContext.containerSize.width, 65);
}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    FavorCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"FavorCollectionCell" bundle:nil forSectionController:self atIndex:index];
    [cell bindViewModel:self.viewModel];
    return cell;
}

-(void)didUpdateToObject:(id)object{
    _object = object;
    self.viewModel = [[FavorCollectionCellModel alloc] initWithModel:_object];
    __weak typeof(self) weakSelf = self;
    self.viewModel.favorBlock = ^(BOOL isFavor) {
        __strong typeof(self) self = weakSelf;
        NSInteger favor = self.object.favor.integerValue;
        self.object.favor = isFavor ? @(favor + 1) : @(favor - 1);
    };
}
@end
