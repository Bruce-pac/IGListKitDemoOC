//
//  FeedModel.h
//  IGListKitDemo
//
//  Created by gxy on 2018/5/28.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiffable.h>
#import "Comment.h"
@interface FeedModel : NSObject<IGListDiffable>
@property (nonatomic,copy) NSNumber *feedId;
@property (nonatomic,copy) NSString *avatar;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSArray<NSString *> *images;
@property (nonatomic,copy) NSNumber *favor;
@property (nonatomic,assign) BOOL isFavor;
@property (nonatomic,copy) NSArray<Comment *> *comments;
@end
