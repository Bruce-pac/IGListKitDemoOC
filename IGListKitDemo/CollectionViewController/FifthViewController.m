//
//  FifthViewController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/6/25.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "FifthViewController.h"
#import "NSArray+FP.h"
#import "ADModel.h"
#import "FeedSectionController.h"
#import "AdSectionController.h"


@interface FifthViewController ()

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *json = [JsonTool arrayWithJson:@"data5"];
    self.objects = [json mutableMap:^id(NSDictionary *element) {
        NSInteger type = [element[@"type"] integerValue];
        if (type == 1) {
            return [FeedModel mj_objectWithKeyValues:element[@"data"]];
        }else{
            return [ADModel mj_objectWithKeyValues:element[@"data"]];
        }
    }];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    self.adapter.dataSource = self;
    self.adapter.collectionView = self.collectionView;
}

-(IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    if ([object isKindOfClass:[FeedModel class]]) {
        FeedSectionController *section = [FeedSectionController new];
        section.inset = UIEdgeInsetsMake(5, 0, 0, 0);
        return section;
    }
    if ([object isKindOfClass:[ADModel class]]) {
        return [AdSectionController new];
    }
    return nil;
}

@end
