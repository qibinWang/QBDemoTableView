# QBDemoTableView
简单的利用链式编程设置tableview  一行代码生成



# 代码调用示例  
 ```objective-c
   self.demoView.addBtn(@"按钮一",^{
        NSLog(@"点击了按钮一");
   });

```
### 方法相关属性介绍
 ```objective-c
-(void(^)(NSString *name,dispatch_block_t callBack))addBtn;
```
``name：table显示的名称``

``callBack：点击回调``
