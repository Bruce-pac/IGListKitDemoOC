//
//  ImageCell.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/30.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "ImageCell.h"

@interface ImageCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)bindViewModel:(UIImage *)image{
    self.imageView.image = image;
}

@end
