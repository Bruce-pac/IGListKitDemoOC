//
//  ContentCollectionCell.m
//  IGListKitDemo
//
//  Created by gxy on 2018/5/28.
//  Copyright © 2018年 gxy. All rights reserved.
//

#import "ContentCollectionCell.h"

@interface ContentCollectionCell ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ContentCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)bindViewModel:(NSString *)viewModel{
    self.textLabel.text = viewModel;
}

+(CGFloat)lineHeight{
    UIFont *font = [UIFont systemFontOfSize:16];
    return font.lineHeight + font.ascender + font.descender;
}

+(CGFloat)heightWithText:(NSString *)text width:(CGFloat)width{
    UIFont *font = [UIFont systemFontOfSize:16];
    CGSize size = CGSizeMake(width - 20, CGFLOAT_MAX);
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return ceil(rect.size.height) + font.ascender + font.descender;
}
@end
