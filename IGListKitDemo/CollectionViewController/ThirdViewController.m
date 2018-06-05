//
//  ThirdViewController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/6/3.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *json = [JsonTool arrayWithJson:@"data3"];
    [self.objects addObjectsFromArray:[FeedModel mj_objectArrayWithKeyValuesArray:json]];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    self.adapter.dataSource = self;
    self.adapter.collectionView = self.collectionView;
    [self addNotificationObserver];
}

-(IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    IGListStackedSectionController *stack = [[IGListStackedSectionController alloc] initWithSectionControllers:@[[UserInfoSectionController new],[ContentSectionController new],[ImageSectionController new],[FavorSectionController new]]];
    stack.inset = UIEdgeInsetsMake(5, 0, 0, 0);
    return stack;
}

- (void)addNotificationObserver{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteNoti:) name:kStackSectionDeleteNotification object:nil];
}

- (void)deleteNoti:(NSNotification *)noti{
    NSInteger section = [noti.object integerValue];
    [self.objects removeObjectAtIndex:section];
    [self.adapter performUpdatesAnimated:YES completion:nil];
}


@end
