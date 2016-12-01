//
//  ViewController.m
//  MasonryDemo
//
//  Created by jiahao on 2016/12/1.
//  Copyright © 2016年 SILICN. All rights reserved.
//

#import "ViewController.h"

#import <Masonry.h>

#import "MasViewController.h"



#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kScreenHeight [UIScreen mainScreen].bounds.size.height



@interface ViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@property (nonatomic, strong) UITableView *tableView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    self.scrollerView.contentSize = CGSizeMake(kScreenWidth * 2, self.scrollerView.bounds.size.height);
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor orangeColor];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.scrollerView addSubview:tableView];
    
    self.tableView = tableView;
    
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.scrollerView.mas_width);
        make.height.equalTo(self.scrollerView.mas_height).offset(-64);
    }];
    
    
    UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.scrollerView addSubview:tableV];
    
    tableV.delegate  = self;
    tableV.dataSource = self;
    
    [tableV registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    tableV.backgroundColor = [UIColor redColor];
   
    [tableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tableView.mas_right);
        make.top.mas_equalTo(tableView);
        make.height.mas_equalTo(tableView);
        make.width.mas_equalTo(tableView);
    }];
    
    NSLog(@"%@  %@",tableView,self.scrollerView);

    
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (tableView == self.tableView) {
        cell.backgroundColor = [UIColor lightGrayColor];
    }
    return cell;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"%s",__FUNCTION__);
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MasViewController  *vc = [MasViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
