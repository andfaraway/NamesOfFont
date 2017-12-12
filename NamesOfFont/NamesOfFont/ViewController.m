//
//  ViewController.m
//  NamesOfFont
//
//  Created by libin on 2017/12/12.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *fontNames;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"系统字体";
    _fontNames = [self getFontNames];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
}

//获取字体数组
- (NSMutableArray *)getFontNames
{
    NSArray *familyNames = [UIFont familyNames];
    NSMutableArray *fontnames = [NSMutableArray new];
    for (NSString *familyName in familyNames) {
        NSArray *arr = [UIFont fontNamesForFamilyName:familyName];
        [fontnames addObject:arr];
    }
    
    return fontnames;
}

#pragma mark - tableview 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _fontNames.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = _fontNames[section];
    return arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSArray *arr =_fontNames[indexPath.section];
    cell.textLabel.font = [UIFont fontWithName:arr[indexPath.row] size:15];
    cell.textLabel.text = [NSString stringWithFormat:@"字体名称01234:%@ ",arr[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *text = cell.textLabel.text;
    NSString *fontName = [text substringWithRange:NSMakeRange(10,text.length-10)];
    NSLog(@"%@",fontName);
    TestViewController *vc = [TestViewController new];

    vc.title = fontName;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
