//
//  ContentSectionController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/28.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "ContentSectionController.h"
#import "FeedModel.h"
#import "ContentCollectionCell.h"
@interface ContentSectionController ()
@property(nonatomic,strong) FeedModel *object;
@property (nonatomic) BOOL expanded;
@end

@implementation ContentSectionController

-(NSInteger)numberOfItems{
    if (!self.object.content) {
        return 0;
    }
    return 1;
}

-(CGSize)sizeForItemAtIndex:(NSInteger)index{
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat height  = _expanded ? [ContentCollectionCell heightWithText:self.object.content width:width] : [ContentCollectionCell lineHeight];
    return CGSizeMake(width, height);
}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    ContentCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"ContentCollectionCell" bundle:nil forSectionController:self atIndex:index];
    [cell bindViewModel:self.object.content];
    return cell;
}

-(void)didUpdateToObject:(id)object{
    _object = object;
}

-(void)didSelectItemAtIndex:(NSInteger)index{
    _expanded = !_expanded;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
        [self.collectionContext invalidateLayoutForSectionController:self completion:nil];
    } completion:nil];
}
@end
