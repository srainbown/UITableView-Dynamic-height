//
//  DiscoverTableViewCell.m
//  TableView动态高度
//
//  Created by 李自杨 on 2017/4/26.
//  Copyright © 2017年 View. All rights reserved.
//

#import "DiscoverTableViewCell.h"
#import <Masonry.h>

@interface DiscoverTableViewCell()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, assign) NSInteger indexRow;

@end

@implementation DiscoverTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
    
}

-(void)createUI{
    
    //这里约束一定要做好，如果发现cell高度并不能自适应，那么一定是约束有问题。要注意撑起顶部和底部的约束一定不能少。
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_btn];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.bottom.mas_equalTo(self.mas_bottom).offset(- 10);
        make.size.mas_equalTo(CGSizeMake(40, 15));
    }];
    [_btn setTitle:@"展开" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _titleLabel = [[UILabel alloc]init];
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(- 10);
        make.bottom.mas_equalTo(_btn.mas_top).offset(- 10);
    }];
    _titleLabel.textColor = [UIColor orangeColor];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.numberOfLines = 0;
    
}

-(void)setData:(NSString *)dataStr andIndexRow:(NSInteger)indexRow andType:(NSString *)type{
    
    //赋值
    self.indexRow = indexRow;
    _titleLabel.text = dataStr;
    
    //行数计算
    CGRect rect = [_titleLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil];
    
    CGSize textSize = [_titleLabel.text sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20]}];
    
    NSUInteger textRow = (NSUInteger)(rect.size.height / textSize.height);
    
    NSLog(@"行数 -- %lu",textRow);//行数
    
    //根据状态判断显示“收起”或者“展开”文字，主要是因为当前cell滚出屏幕后再滚回来会恢复原始未展开状态，这里是为了保存展开的状态不变
    if ([type isEqualToString:@"NO"]) {
        
        if (textRow > 3) {
            _titleLabel.numberOfLines = 3;
            [_btn setTitle:@"展开" forState:UIControlStateNormal];
            _btn.selected = NO;
        }else{
            
            //因为小于等于3行，所以移除“展开”按钮
            [_btn removeFromSuperview];
            //更新UILabel的约束
            [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self).insets(UIEdgeInsetsMake(10, 10, 10, 10));
            }];
            
        }
    }else{
        //只有大于3行才会出现 type 为 YES 的情况，所以此处不需要再额外的判断行数
            _titleLabel.numberOfLines = 0;
            [_btn setTitle:@"收起" forState:UIControlStateNormal];
            _btn.selected = YES;

    }

}

//展开收起按钮的点击事件
-(void)btnClick:(UIButton *)sender{

    //默认为收起状态，显示文字为“展开”
    NSString *str = @"NO";
    
    if (sender.selected == NO) {//点击展开
        NSLog(@"展开");
        str = @"YES";
        //设置按钮的状态和显示文字
        sender.selected = YES;
        [sender setTitle:@"收起" forState:UIControlStateNormal];
        //设置UILabel的行数
        self.titleLabel.numberOfLines = 0;
        
    }else{//点击收起
        NSLog(@"收起");
        str = @"NO";
        //设置按钮的状态和显示文字
        sender.selected = NO;
        [sender setTitle:@"展开" forState:UIControlStateNormal];
        //设置UILabel的行数
        self.titleLabel.numberOfLines = 3;
    }
    
    //当前cell的indexPath.row
    NSString *index = [NSString stringWithFormat:@"%ld",_indexRow];
    //当前cell的展开或收起状态
    NSDictionary *dict = @{index:str};

    [_delegate disCoverBtnClick:dict];

}


@end
