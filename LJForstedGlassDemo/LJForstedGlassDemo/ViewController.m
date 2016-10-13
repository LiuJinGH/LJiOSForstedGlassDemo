//
//  ViewController.m
//  LJForstedGlassDemo
//
//  Created by 刘瑾 on 2016/10/13.
//  Copyright © 2016年 刘瑾. All rights reserved.
//

#import "ViewController.h"

#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic) UIVisualEffectView *effectView;
@property (nonatomic) UIToolbar *bar;

@end

@implementation ViewController

-(void )changeValueOfSeg:(UISegmentedControl *)sender{
    
    if (sender.selectedSegmentIndex) {
//        self.effectView.hidden = NO;
        self.bar.hidden = NO;
    }else{
//        self.effectView.hidden = YES;
        self.bar.hidden = YES;
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"无毛玻璃效果", @"有毛玻璃效果"]];
    [self.view addSubview:seg];
    [seg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(30);
        make.centerX.equalTo(0);
    }];
    [seg addTarget:self action:@selector(changeValueOfSeg:) forControlEvents:UIControlEventValueChanged];
    
    seg.selectedSegmentIndex = 1;
    
    UIImageView *iv = [UIImageView new];
    [self.view addSubview:iv];
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    
    iv.image = [UIImage imageNamed:@"pic2.jpg"];
    
//    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
//    [iv addSubview:effectView];
//    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(0);
//    }];
//    self.effectView = effectView;
    
    UIToolbar *bar = [[UIToolbar alloc] init];
    [iv addSubview:bar];
    [bar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [bar setBarStyle:UIBarStyleBlack];
    bar.translatesAutoresizingMaskIntoConstraints = NO;
    self.bar = bar;
}



@end
