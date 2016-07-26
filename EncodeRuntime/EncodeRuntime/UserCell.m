//
//  UserCell.m
//  EncodeRuntime
//
//  Created by JianRongCao on 7/26/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (UIImageView *)iconView
{
    if(!_iconView){
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        [self addSubview:_iconView];
    }
    return _iconView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 100, 20)];
        _nameLabel.textColor = [UIColor redColor];
        _nameLabel.font = [UIFont systemFontOfSize:13.0];
        _nameLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)schoolLabel
{
    if (!_schoolLabel) {
        _schoolLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 100, 20)];
        _schoolLabel.textColor = [UIColor redColor];
        _schoolLabel.font = [UIFont systemFontOfSize:13.0];
        _schoolLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:_schoolLabel];
    }
    return _schoolLabel;
}

- (UILabel *)subLabel
{
    if (!_subLabel) {
        _subLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 100, 20)];
        _subLabel.textColor = [UIColor redColor];
        _subLabel.font = [UIFont systemFontOfSize:13.0];
        _subLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:_subLabel];
    }
    return _subLabel;
}

@end
