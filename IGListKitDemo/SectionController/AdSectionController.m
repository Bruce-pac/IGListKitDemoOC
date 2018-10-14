//
//  AdSectionController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/6/25.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "AdSectionController.h"
#import "AdCollectionCell.h"

@interface AdSectionController ()
@property(nonatomic,strong) ADModel *object;
@end

@implementation AdSectionController
-(NSInteger)numberOfItems{
    return 1;
}

-(CGSize)sizeForItemAtIndex:(NSInteger)index{
    return CGSizeMake(self.collectionContext.containerSize.width, 100);
}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    AdCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"AdCollectionCell" bundle:nil forSectionController:self atIndex:index];
    [cell bindViewModel:_object];
    return cell;
}

-(void)didUpdateToObject:(id)object{
    _object = object;
    self.inset = UIEdgeInsetsMake(5, 0, 0, 0);
}

@end
