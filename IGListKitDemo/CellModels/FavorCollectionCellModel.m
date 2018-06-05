//
//  FavorCollectionCellModel.m
//  IGListKitDemo
//
//  Created by gxy on 2018/6/3.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "FavorCollectionCellModel.h"
#import "FeedModel.h"

#define GBKeyPath(objc, keyPath) @(((void)objc.keyPath, #keyPath))

@implementation FavorCollectionCellModel

-(void)dealloc{
    [self.model removeObserver:self forKeyPath:GBKeyPath(self.model, favor)];
}

-(instancetype)initWithModel:(FeedModel *)model{
    self = [super init];
    if (self) {
        _model = model;
        [model addObserver:self forKeyPath:GBKeyPath(model, favor) options:NSKeyValueObservingOptionNew context:nil];
        _isFavor = model.isFavor;
        _favorNum = [NSString stringWithFormat:@"%ld个👍",model.favor.unsignedIntegerValue];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:GBKeyPath(self.model, favor)]) {
        NSNumber *favor = change[NSKeyValueChangeNewKey];
        self.favorNum = [NSString stringWithFormat:@"%ld个👍",favor.unsignedIntegerValue];
    }
}
@end
