//
//  FeedBindingSectionController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/11/24.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "FeedBindingSectionController.h"
#import "FeedModel.h"
#import "UserInfoCell.h"
#import "ContentCollectionCell.h"
#import "ImagesCollectionCell.h"
#import "FavorCollectionCell.h"
#import "CommentCollectionCell.h"
#import "ImagesCollectionCellModel.h"
#import "FavorCollectionCellModel.h"
#import "CommentCollectionCellModel.h"
#import "NSArray+FP.h"

#define KInsetLeft 10

@interface FeedBindingSectionController ()<IGListBindingSectionControllerDataSource,IGListBindingSectionControllerSelectionDelegate,UserInfoCellDelegate>
@property(nonatomic,strong,readonly) FeedModel *dataObject;
@property (nonatomic) BOOL expanded;
@end

@implementation FeedBindingSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = self;
        self.selectionDelegate = self;
        self.inset = UIEdgeInsetsMake(5, 0, 0, 0);
    }
    return self;
}

- (nonnull UICollectionViewCell<IGListBindable> *)sectionController:(nonnull IGListBindingSectionController *)sectionController cellForViewModel:(nonnull id)viewModel atIndex:(NSInteger)index {
    if ([viewModel isKindOfClass:[UserInfoCellModel class]]) {
        UserInfoCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"UserInfoCell" bundle:nil forSectionController:self atIndex:index];
        cell.delegate = self;
        return cell;
    }
    if ([viewModel isKindOfClass:[NSString class]]) {
        ContentCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"ContentCollectionCell" bundle:nil forSectionController:self atIndex:index];
        return cell;
    }
    if ([viewModel isKindOfClass:[ImagesCollectionCellModel class]]) {
        ImagesCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"ImagesCollectionCell" bundle:nil forSectionController:self atIndex:index];
        return cell;
    }
    if ([viewModel isKindOfClass:[FavorCollectionCellModel class]]) {
        FavorCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"FavorCollectionCell" bundle:nil forSectionController:self atIndex:index];
        return cell;
    }
    if ([viewModel isKindOfClass:[CommentCollectionCellModel class]]) {
        CommentCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"CommentCollectionCell" bundle:nil forSectionController:self atIndex:index];
        return cell;
    }
    return [UICollectionViewCell<IGListBindable> new];
}

- (CGSize)sectionController:(nonnull IGListBindingSectionController *)sectionController sizeForViewModel:(nonnull id)viewModel atIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    if ([viewModel isKindOfClass:[UserInfoCellModel class]]) {
        return CGSizeMake(width, 25);
    }
    if ([viewModel isKindOfClass:[NSString class]]) {
        CGFloat height  = _expanded ? [ContentCollectionCell heightWithText:self.dataObject.content width:width] : [ContentCollectionCell lineHeight];
        return CGSizeMake(width, height);
    }
    if ([viewModel isKindOfClass:[ImagesCollectionCellModel class]]) {
        CGFloat mwidth = (width - KInsetLeft * 4.f) / 3.f;
        CGFloat height = (self.dataObject.images.count - 1) / 3 *(mwidth + KInsetLeft) + mwidth;
        return CGSizeMake(width, height);
    }
    if ([viewModel isKindOfClass:[FavorCollectionCellModel class]]) {
        return CGSizeMake(width, 65);
    }
    if ([viewModel isKindOfClass:[CommentCollectionCellModel class]]) {
        return CGSizeMake(width, 50);
    }
    return CGSizeZero;
}

- (nonnull NSArray<id<IGListDiffable>> *)sectionController:(nonnull IGListBindingSectionController *)sectionController viewModelsForObject:(nonnull FeedModel *)object {
    NSMutableArray *viewModels = [NSMutableArray array];
    UserInfoCellModel *vm1 = [[UserInfoCellModel alloc] initWithUserName:object.userName];
    [viewModels addObject:vm1];
    if (object.content) {
        [viewModels addObject:object.content];
    }

    if (object.images.count > 0) {
        [viewModels addObject:[[ImagesCollectionCellModel alloc] initWithImages:object.images]];
    }
    FavorCollectionCellModel *vm2 = [[FavorCollectionCellModel alloc] initWithModel:object];
    __weak typeof(self) weakSelf = self;
    vm2.favorBlock = ^(BOOL isFavor) {
        __strong typeof(self) self = weakSelf;
        NSInteger favor = self.dataObject.favor.integerValue;
        self.dataObject.favor = isFavor ? @(favor + 1) : @(favor - 1);
    };
    [viewModels addObject:vm2];

    NSArray<CommentCollectionCellModel *> *comments = [object.comments map:^id(Comment *element) {
        return [[CommentCollectionCellModel alloc] initWithModel:element];
    }];
    [viewModels addObjectsFromArray:comments];
    return viewModels;
}

-(void)sectionController:(IGListBindingSectionController *)sectionController didSelectItemAtIndex:(NSInteger)index viewModel:(id)viewModel{
    if ([viewModel isKindOfClass:[NSString class]]) {
        _expanded = !_expanded;
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
            [self.collectionContext invalidateLayoutForSectionController:self completion:nil];
        } completion:nil];
    }
}

-(void)cellDidClickMore:(UserInfoCell *)cell{

}

-(FeedModel *)dataObject{
    return self.object;
}

@end
