//
//  UserInfoSectionController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/24.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "UserInfoSectionController.h"
#import "UserInfoCell.h"
#import "FeedModel.h"

NSString *const kStackSectionDeleteNotification = @"kStackSectionDeleteNotification";

@interface UserInfoSectionController ()<UserInfoCellDelegate>
@property(nonatomic,strong) FeedModel *object;
@end

@implementation UserInfoSectionController
-(NSInteger)numberOfItems{
    return 1;
}

-(CGSize)sizeForItemAtIndex:(NSInteger)index{
    return CGSizeMake(self.collectionContext.containerSize.width, 25);
}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    UserInfoCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"UserInfoCell" bundle:nil forSectionController:self atIndex:index];
    cell.delegate = self;
    [cell bindViewModel:[[UserInfoCellModel alloc]initWithUserName:_object.userName]];
    return cell;
}

-(void)didUpdateToObject:(id)object{
    _object = object;
}

-(void)cellDidClickMore:(UserInfoCell *)cell{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"share" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        IGListStackedSectionController *stack = self.collectionContext;
        [[NSNotificationCenter defaultCenter] postNotificationName:kStackSectionDeleteNotification object:@(stack.section)];
    }]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [self.viewController presentViewController:actionSheet animated:YES completion:nil];
}
@end
