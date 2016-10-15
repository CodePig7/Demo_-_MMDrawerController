//
//  ViewController.m
//  Demo_测试_MMDrawerController
//
//  Created by AHJD-04 on 16/10/1.
//  Copyright © 2016年 XSLeagues. All rights reserved.
//

#import "ViewController.h"
#import <MMDrawerBarButtonItem.h>
#import <UIViewController+MMDrawerController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"英雄联盟";
    // 1、设置导航栏左边的按钮 
    self.navigationItem.leftBarButtonItem = [[MMDrawerBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"add_friend_nearby"] style:UIBarButtonItemStyleBordered target:self action:@selector(leftBtn)];
    
    //2、添加双击手势
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    //2.1、双击
    [doubleTap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTap];
    
    //3、添加两个手指双击手势
    UITapGestureRecognizer * twoFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerDoubleTap:)];
    //3.1、双击
    [twoFingerDoubleTap setNumberOfTapsRequired:2];
    //3.2、两个手指  默认为一个
    [twoFingerDoubleTap setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:twoFingerDoubleTap];
}

//这里的话是通过遍历循环拿到之前在AppDelegate中声明的那个MMDrawerController属性，然后判断是否为打开状态，如果是就关闭，否就是打开(初略解释，里面还有一些条件)
- (void)leftBtn{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  添加点击手势  一个手指双击
 */
-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

/**
 *  添加点击手势  两个个手指双击
 */
-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}

@end
