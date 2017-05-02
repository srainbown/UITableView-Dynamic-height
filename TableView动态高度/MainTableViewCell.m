//
//  MainTableViewCell.m
//  TableView动态高度
//
//  Created by 李自杨 on 2017/4/26.
//  Copyright © 2017年 View. All rights reserved.
//

#import "MainTableViewCell.h"
#import <Masonry.h>

@interface MainTableViewCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MainTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createUI];
        
    }
    return self;
}

-(void)createUI{
    
    _titleLabel = [[UILabel alloc]init];
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    _titleLabel.textColor = [UIColor orangeColor];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.numberOfLines = 0;
    
}

-(void)setData:(NSString *)dataStr{
    
    _titleLabel.text = dataStr;

}


@end
