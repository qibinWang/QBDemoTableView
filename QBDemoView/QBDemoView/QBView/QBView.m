//
//  QBView.m
//  QBDemoView
//
//  Created by wangqibin on 2018/4/15.
//  Copyright © 2018年 wangqibin. All rights reserved.
//

#import "QBView.h"
#import "YQCommon.h"

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

typedef void (^callBack)(void);

@interface QBView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray * groups;
@property (nonatomic, strong) NSMutableArray * dataArr;
@property (nonatomic, strong) NSMutableArray * callBackArr;
@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic,copy)callBack callBackBlock;
@end

@implementation QBView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self addSubview:self.tableView];
    }
    return self;
}

-(void(^)(NSString *name,dispatch_block_t callBack))addBtn{
    return ^(NSString *name,dispatch_block_t callBack){
        [self.callBackArr addObject:callBack];
        [self addDataInfoWithName:name];
    };
}

-(void)addDataInfoWithName:(NSString *)name{
    YQCommonItem *item = YQObjectInit(YQCommonItem).assistLabelTextSet(name).assistLabelXSet(100).arrowSet(YES).operationSet(^(NSInteger index){
        self.callBackBlock = [self.callBackArr objectAtIndex:index];
        if (self.callBackBlock) {
            self.callBackBlock();
        }
    });
    
    [self.dataArr addObject:item];
    YQCommonGroup *group = YQObjectInit(YQCommonGroup).itemsSet([self.dataArr copy]);
    [self.groups removeAllObjects];
    [self.groups addObject:group];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark - lazy
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(NSMutableArray *)callBackArr{
    if (!_callBackArr) {
        _callBackArr = [NSMutableArray array];
    }
    return _callBackArr;
}

- (NSMutableArray *)groups{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

#pragma mark - tableview Data
YQTabelViewDelegateAndDataSource(self.groups)

@end
