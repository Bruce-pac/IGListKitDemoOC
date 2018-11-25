//
//  CommentCollectionCellModel.h
//  IGListKitDemo
//
//  Created by gxy on 2018/6/6.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiffable.h>
@class Comment;
@interface CommentCollectionCellModel : NSObject<IGListDiffable>
@property (nonatomic,copy) NSString *person;
@property (nonatomic,copy) NSString *comment;
-(instancetype)initWithModel:(Comment *)comment;
@end
