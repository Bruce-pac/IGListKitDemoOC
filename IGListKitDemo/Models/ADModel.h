//
//  ADModel.h
//  IGListKitDemo
//
//  Created by gxy on 2018/6/25.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiffable.h>

@interface ADModel : NSObject<IGListDiffable>
@property (nonatomic,copy) NSString *adTitle;
@property (nonatomic,copy) NSString *adUrl;
@end
