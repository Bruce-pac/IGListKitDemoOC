//
//  BaseCollectionViewController.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/24.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "BaseCollectionViewController.h"

@interface BaseCollectionViewController ()

@end

@implementation BaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

-(UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    return nil;
}

-(NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.objects;
}

-(IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    return nil;
}

-(NSMutableArray *)objects{
    if (!_objects) {
        _objects = [NSMutableArray array];
    }
    return _objects;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flow = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

@end
