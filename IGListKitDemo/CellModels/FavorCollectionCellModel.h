//
//  FavorCollectionCellModel.h
//  IGListKitDemo
//
//  Created by gxy on 2018/6/3.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiffable.h>
@class FeedModel,FavorCollectionCell;
@interface FavorCollectionCellModel : NSObject<IGListDiffable>
@property (nonatomic,assign) BOOL isFavor;
@property (nonatomic,copy) NSString *favorNum;
@property (nonatomic,copy) void (^favorBlock)(BOOL isFavor);
@property(nonatomic,strong,readonly) FeedModel *model;
-(instancetype)initWithModel:(FeedModel *)model;
@end
