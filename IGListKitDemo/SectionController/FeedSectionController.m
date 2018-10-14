//
//  FeedSectionController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/6/6.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "FeedSectionController.h"
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

@interface FeedSectionController ()<UserInfoCellDelegate>
@property(nonatomic,strong) FeedModel *object;
@property(nonatomic,strong) NSMutableArray *viewModels;
@property (nonatomic) BOOL expanded;
@property (nonatomic) BOOL hasContent;
@property (nonatomic) BOOL hasImages;
@end

@implementation FeedSectionController

-(NSInteger)numberOfItems{
    return self.viewModels.count;
}

-(CGSize)sizeForItemAtIndex:(NSInteger)index{
    switch (index) {
        case 0:
            return CGSizeMake(self.collectionContext.containerSize.width, 25);
            break;
        case 1:{
            if (_hasContent) {
                CGFloat width = self.collectionContext.containerSize.width;
                CGFloat height  = _expanded ? [ContentCollectionCell heightWithText:self.object.content width:width] : [ContentCollectionCell lineHeight];
                return CGSizeMake(width, height);
            }
            return [self imageCellSize];
        }break;
        case 2:{
            if (_hasContent && _hasImages) {
                return [self imageCellSize];
            }
            return CGSizeMake(self.collectionContext.containerSize.width, 65);
        }break;
        case 3:{
            if (_hasContent && _hasImages) {
                return CGSizeMake(self.collectionContext.containerSize.width, 65);
            }
            return CGSizeMake(self.collectionContext.containerSize.width, 50);
        }break;
        default:{
            return CGSizeMake(self.collectionContext.containerSize.width, 50);
        }
            break;
    }
}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    switch (index) {
        case 0:{
            UserInfoCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"UserInfoCell" bundle:nil forSectionController:self atIndex:index];
            cell.delegate = self;
            [cell bindViewModel:self.viewModels[index]];
            return cell;
        }
            break;
        case 1:{
            if (_hasContent) {
                ContentCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"ContentCollectionCell" bundle:nil forSectionController:self atIndex:index];
                [cell bindViewModel:self.viewModels[index]];
                return cell;
            }
            return [self cellWithIndex:index];
        }break;
        case 2:{
            if (_hasContent && _hasImages) {
                return [self cellWithIndex:index];
            }
            FavorCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"FavorCollectionCell" bundle:nil forSectionController:self atIndex:index];
            [cell bindViewModel:self.viewModels[index]];
            return cell;
        }break;
        case 3:{
            if (_hasContent && _hasImages) {
                FavorCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"FavorCollectionCell" bundle:nil forSectionController:self atIndex:index];
                [cell bindViewModel:self.viewModels[index]];
                return cell;
            }
            CommentCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"CommentCollectionCell" bundle:nil forSectionController:self atIndex:index];
            [cell bindViewModel:self.viewModels[index]];
            return cell;
        }break;
        default:{
            CommentCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"CommentCollectionCell" bundle:nil forSectionController:self atIndex:index];
            [cell bindViewModel:self.viewModels[index]];
            return cell;
        }
            break;
    }
}

-(void)didUpdateToObject:(FeedModel *)object{
    _object = object;
    UserInfoCellModel *vm1 = [[UserInfoCellModel alloc] initWithUserName:object.userName];
    [self.viewModels addObject:vm1];
    if (object.content) {
        _hasContent = YES;
        [self.viewModels addObject:object.content];
    }

    if (object.images.count > 0) {
        _hasImages = YES;
        [self.viewModels addObject:[[ImagesCollectionCellModel alloc] initWithImages:object.images]];
    }
    FavorCollectionCellModel *vm2 = [[FavorCollectionCellModel alloc] initWithModel:_object];
    __weak typeof(self) weakSelf = self;
    vm2.favorBlock = ^(BOOL isFavor) {
        __strong typeof(self) self = weakSelf;
        NSInteger favor = self.object.favor.integerValue;
        self.object.favor = isFavor ? @(favor + 1) : @(favor - 1);
    };
    [self.viewModels addObject:vm2];

    NSArray<CommentCollectionCellModel *> *comments = [object.comments map:^id(Comment *element) {
        return [[CommentCollectionCellModel alloc] initWithModel:element];
    }];
    [self.viewModels addObjectsFromArray:comments];
}

-(void)didSelectItemAtIndex:(NSInteger)index{
    if (_hasContent && index == 1) {
        _expanded = !_expanded;
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
            [self.collectionContext invalidateLayoutForSectionController:self completion:nil];
        } completion:nil];
    }
}

- (CGSize)imageCellSize{
    CGFloat width = (self.collectionContext.containerSize.width - KInsetLeft * 4.f) / 3.f;
    CGFloat height = (_object.images.count - 1) / 3 *(width + KInsetLeft) + width;
    return CGSizeMake(self.collectionContext.containerSize.width, height);
}

- (ImagesCollectionCell *)cellWithIndex:(NSInteger)index{
    ImagesCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"ImagesCollectionCell" bundle:nil forSectionController:self atIndex:index];
    [cell bindViewModel:self.viewModels[index]];
    return cell;
}

-(void)cellDidClickMore:(UserInfoCell *)cell{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"share" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.collectionContext performBatchAnimated:YES updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
           NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.viewModels.count)];
            [self.viewModels removeAllObjects];
            [batchContext deleteInSectionController:self atIndexes:set];
        } completion:^(BOOL finished) {

        }];
    }]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [self.viewController presentViewController:actionSheet animated:YES completion:nil];
}

-(NSMutableArray *)viewModels{
    if (!_viewModels) {
        _viewModels = [NSMutableArray array];
    }
    return _viewModels;
}
@end
