//
//  CommentCollectionCellModel.m
//  IGListKitDemo
//
//  Created by gxy on 2018/6/6.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "CommentCollectionCellModel.h"
#import "Comment.h"

@implementation CommentCollectionCellModel
-(instancetype)initWithModel:(Comment *)comment{
    self = [super init];
    if (self) {
        _person  = comment.person;
        _comment = [NSString stringWithFormat:@"回复了:%@",comment.comment];
    }
    return self;
}

-(id<NSObject>)diffIdentifier{
    return @(self.person.hash ^ self.comment.hash);
}

-(BOOL)isEqualToDiffableObject:(NSObject<IGListDiffable> *)object{
    if (object == self) {
        return YES;
    } else if (![object isKindOfClass:[CommentCollectionCellModel class]]) {
        return NO;
    } else {
        CommentCollectionCellModel *obj = (CommentCollectionCellModel *)object;
        return [self.person isEqualToString:obj.person] && [self.comment isEqualToString:obj.comment];
    }
}
@end
