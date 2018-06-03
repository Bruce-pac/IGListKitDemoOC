//
//  ImageSectionController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/30.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "ImageSectionController.h"
#import "FeedModel.h"
#import "ImageCell.h"
#import "ImagesCollectionCell.h"
#import "ImagesCollectionCellModel.h"

#define KInsetLeft 10

@interface ImageSectionController ()
@property(nonatomic,strong) FeedModel *object;
@property(nonatomic,strong) ImagesCollectionCellModel *model;
@end

@implementation ImageSectionController

-(NSInteger)numberOfItems{
    if (!_object.images || _object.images.count == 0) {
        return 0;
    }
    return 1;
}

-(CGSize)sizeForItemAtIndex:(NSInteger)index{
    CGFloat width = (self.collectionContext.containerSize.width - KInsetLeft * 4.f) / 3.f;
    CGFloat height = (_object.images.count - 1) / 3 *(width + KInsetLeft) + width;
    return CGSizeMake(self.collectionContext.containerSize.width, height);
}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    ImagesCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"ImagesCollectionCell" bundle:nil forSectionController:self atIndex:index];
    [cell bindViewModel:_model];
    return cell;
}

-(void)didUpdateToObject:(id)object{
    _object = object;
    _model = [[ImagesCollectionCellModel alloc] initWithImages:_object.images];
}
@end
