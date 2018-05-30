//
//  OneCollectionViewController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/24.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "OneCollectionViewController.h"
#import "UserInfoSectionController.h"
#import "ContentSectionController.h"
#import "FeedModel.h"
#import <MJExtension.h>
@interface OneCollectionViewController ()

@end

@implementation OneCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *json = [JsonTool arrayWithJson:@"data1"];
    [self.objects addObjectsFromArray:[FeedModel mj_objectArrayWithKeyValuesArray:json]];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    self.adapter.dataSource = self;
    self.adapter.collectionView = self.collectionView;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteNoti:) name:kStackSectionDeleteNotification object:nil];
}

-(IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    IGListStackedSectionController *stack = [[IGListStackedSectionController alloc] initWithSectionControllers:@[[UserInfoSectionController new],[ContentSectionController new]]];
    stack.inset = UIEdgeInsetsMake(5, 0, 0, 0);
    return stack;
}

- (void)deleteNoti:(NSNotification *)noti{
    NSInteger section = [noti.object integerValue];
    [self.objects removeObjectAtIndex:section];
    [self.adapter performUpdatesAnimated:YES completion:nil];
}
@end
