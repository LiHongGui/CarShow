//
//  ViewController.m
//  CarShow
//
//  Created by MichaelLi on 2016/10/20.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "ViewController.h"
#import "CarModel.h"
//代理
@interface ViewController ()<UITableViewDataSource>
@property(nonatomic,strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

#pragma mark
#pragma mark -  遍历
-(NSArray *)dataArray
{
    if (_dataArray ==nil) {
        //读取文件路径
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"cars_simple.plist" ofType:nil];
        //读取文件到临时数组
        NSArray *temp = [NSArray arrayWithContentsOfFile:filePath];
        //创建可变数组
        NSMutableArray *mutb = [NSMutableArray array];
        //字典转模型---可变数组
        for (NSDictionary *dict in temp) {
            CarModel *carModel = [CarModel carModelWithDict:dict];
            [mutb addObject:carModel];
        }
        _dataArray = mutb;
    }
    return _dataArray;
}
#pragma mark
#pragma mark -  组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
#pragma mark
#pragma mark -  行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //取出Model
    CarModel *carModel = self.dataArray[section];
    //行:有多少cars就有多少行
    NSArray *cars = carModel.cars;
    return cars.count;
}

#pragma mark
#pragma mark -  内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //内容在NSArray 中的cars中
    //取出model
    CarModel *carModel = self.dataArray[indexPath.section];
    NSArray *cars = carModel.cars;
    cell.textLabel.text = cars[indexPath.row];
    return cell;

}
#pragma mark
#pragma mark -  设置头文本
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //取出Model
    CarModel *carModel = self.dataArray[section];
    NSString *str = carModel.title;
    return str;
}
#pragma mark
#pragma mark -  设置页脚文本
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    CarModel *carModel = self.dataArray[section];
    NSString *str = carModel.desc;
    return str;
}
#pragma mark
#pragma mark -  隐藏状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
