//
//  ViewController.m
//  QBDemoView
//
//  Created by wangqibin on 2018/4/15.
//  Copyright © 2018年 wangqibin. All rights reserved.
//

#import "ViewController.h"
#import "QBView/QBView.h"
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property(nonatomic,copy)QBView *demoView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.demoView];
    self.demoView.addBtn(@"按钮一",^{
        NSLog(@"点击了按钮一");
    });
    
    self.demoView.addBtn(@"按钮二",^{
        NSLog(@"点击了按钮二");
    });
}


-(QBView *)demoView{
    if (!_demoView) {
        _demoView = [[QBView alloc] init];
        [_demoView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
    }
    return _demoView;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}
@end
