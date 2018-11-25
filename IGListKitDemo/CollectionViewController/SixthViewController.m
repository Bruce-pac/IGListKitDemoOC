//
//  SixthViewController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/11/24.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "SixthViewController.h"
#import "FeedBindingSectionController.h"

@interface SixthViewController ()

@end

@implementation SixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *json = [JsonTool arrayWithJson:@"data4"];
    [self.objects addObjectsFromArray:[FeedModel mj_objectArrayWithKeyValuesArray:json]];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    self.adapter.dataSource = self;
    self.adapter.collectionView = self.collectionView;

}

-(IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    FeedBindingSectionController<FeedModel *> *section = [FeedBindingSectionController<FeedModel *> new];
    return section;
}

@end
