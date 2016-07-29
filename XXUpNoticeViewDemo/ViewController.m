//
//  ViewController.m
//  XXUpNoticeViewDemo
//
//  Created by 朱小亮 on 16/7/28.
//  Copyright © 2016年 zhusven. All rights reserved.
//

#import "ViewController.h"
#import "XXUpNoticeView.h"
#import "XXTableViewCell.h"
#import "XXItem.h"

@interface ViewController ()<XXUpNoticeViewDataSourceDelegate>
@property (strong,nonatomic)IBOutlet XXUpNoticeView *noticeView1;
@property (strong,nonatomic)IBOutlet XXUpNoticeView *noticeView2;
@end

@interface ViewController()
@property(strong,nonatomic)NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.noticeView1.dataSourceDelegate = self;
    self.noticeView2.dataSourceDelegate = self;
    self.noticeView2.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.noticeView2.layer.borderWidth = 1;

    
}


- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        for (int i =0 ; i<10; i++) {
            XXItem *item = [XXItem new];
            item.title1 = i%2==0?@"最新":@"数码";
            item.title2 = i%2!=0?@"最新":@"数码";
            item.title11 = [[NSString alloc] initWithFormat:@"谁最帅,点赞的你最帅,😄,+%d",i];
            item.title22 = [[NSString alloc] initWithFormat:@"谁最帅,点赞的你我他都帅,😄,+%d",i];
            [_dataSource addObject:item];
        }
    
    }
   
    return _dataSource;
}

- (NSArray *)itemsOfXXUpNoticeView:(XXUpNoticeView *)noticeView{
    return self.dataSource;// [UILocalizedIndexedCollation.currentCollation sectionIndexTitles];
}

- (UITableViewCell *)XXUpNoticeView:(XXUpNoticeView *)noticeView tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath dataSource:(NSMutableArray *)dataSource{

    XXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([XXTableViewCell class])];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([XXTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:NSStringFromClass([XXTableViewCell class])];
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([XXTableViewCell class])];
    }
     cell.item = dataSource[indexPath.row];//这个为实际的tableview的数据源
    return cell;

}

- (void)XXUpNoticeView:(XXUpNoticeView *)noticeView didSelectRow:(NSInteger)index
{
    NSLog(@"index = %ld",(long)index);
}



@end
