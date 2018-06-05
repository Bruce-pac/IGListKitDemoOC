//
//  BaseCollectionViewController.h
//  IGListKitDemo
//
//  Created by gxy on 2018/5/24.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit.h>
#import <MJExtension.h>
#import "JsonTool.h"
#import "UserInfoSectionController.h"
#import "ContentSectionController.h"
#import "ImageSectionController.h"
#import "FavorSectionController.h"
#import "FeedModel.h"

@interface BaseCollectionViewController : UIViewController<IGListAdapterDataSource>
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) IGListAdapter *adapter;
@property(nonatomic,strong) NSMutableArray *objects;
@end
