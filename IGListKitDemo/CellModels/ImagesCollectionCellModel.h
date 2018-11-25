//
//  ImagesCollectionCellModel.h
//  IGListKitDemo
//
//  Created by gxy on 2018/5/30.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>
#import <IGListDiffable.h>

@interface ImagesCollectionCellModel : NSObject<IGListDiffable>
@property (nonatomic,copy) NSArray<UIImage *> *images;
-(instancetype)initWithImages:(NSArray<NSString *> *)urls;
@end
