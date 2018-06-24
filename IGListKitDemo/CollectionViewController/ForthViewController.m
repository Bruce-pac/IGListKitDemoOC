//
//  ForthViewController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/6/6.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "ForthViewController.h"
#import "FeedSectionController.h"

@interface ForthViewController ()

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *json = [JsonTool arrayWithJson:@"data4"];
    [self.objects addObjectsFromArray:[FeedModel mj_objectArrayWithKeyValuesArray:json]];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    self.adapter.dataSource = self;
    self.adapter.collectionView = self.collectionView;

}

-(IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    FeedSectionController *section = [FeedSectionController new];
    section.inset = UIEdgeInsetsMake(5, 0, 0, 0);
    return section;
}

@end
