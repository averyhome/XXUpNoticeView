//
//  XXTableViewCell.m
//  XXUpNoticeViewDemo
//
//  Created by 朱小亮 on 16/7/29.
//  Copyright © 2016年 zhusven. All rights reserved.
//

#import "XXTableViewCell.h"


@interface XXTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label11;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label22;

@end

@implementation XXTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.label1.layer.borderColor = [UIColor redColor].CGColor;
    self.label1.layer.cornerRadius = 5;
    self.label1.layer.borderWidth = 0.5;
    self.label1.layer.masksToBounds = YES;
    
    self.label2.layer.borderColor = [UIColor redColor].CGColor;
    self.label2.layer.cornerRadius = 5;
    self.label2.layer.borderWidth = 0.5;
    self.label2.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setItem:(XXItem *)item{
    self.label1.text = item.title1;
    self.label11.text = item.title11;
    self.label2.text = item.title2;
    self.label22.text = item.title22;
}

@end
