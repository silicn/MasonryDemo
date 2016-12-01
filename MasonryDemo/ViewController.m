//
//  ViewController.m
//  MasonryDemo
//
//  Created by jiahao on 2016/12/1.
//  Copyright © 2016年 SILICN. All rights reserved.
//

#import "ViewController.h"

#import <Masonry.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_topMargin).offset(100);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@44);
        make.width.equalTo(@300);
        
    }];
    
    
    UILabel *label = [UILabel new];
    
    label.backgroundColor = [UIColor cyanColor];
    
    label.text = @"好好爱好好好好哈嗷嗷好好好";
    
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view.mas_centerX);
        make.top.equalTo(view.mas_bottom).offset(8);
        make.height.equalTo(@44);
        
    }];
    
    UIImageView *imageview = [UIImageView new];
    
    imageview.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:imageview];
    
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(100, 100)]);
        make.topMargin.equalTo(label.mas_bottom).offset(20);
        make.centerX.equalTo(label.mas_centerX);
        
    }];
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
