//
//  QBView.h
//  QBDemoView
//
//  Created by wangqibin on 2018/4/15.
//  Copyright © 2018年 wangqibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QBView : UIView

-(void(^)(NSString *name,dispatch_block_t callBack))addBtn;

@end
