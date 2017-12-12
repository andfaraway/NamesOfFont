//
//  TestViewController.m
//  NamesOfFont
//
//  Created by libin on 2017/12/12.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width-20, 300)];
    if (self.title) {
        textView.font = [UIFont fontWithName:self.title size:15];
    }
    textView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
