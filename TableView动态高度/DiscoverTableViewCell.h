//
//  DiscoverTableViewCell.h
//  TableView动态高度
//
//  Created by 李自杨 on 2017/4/26.
//  Copyright © 2017年 View. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DiscoverDelegate <NSObject>

-(void)disCoverBtnClick:(NSDictionary *)dict;

@end

@interface DiscoverTableViewCell : UITableViewCell

@property (nonatomic, weak) id <DiscoverDelegate> delegate;

-(void)setData:(NSString *)dataStr andIndexRow:(NSInteger )indexRow andType:(NSString *)type;

@end
