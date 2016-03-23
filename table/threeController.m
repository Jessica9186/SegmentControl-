//
//  threeController.m
//  table
//
//  Created by zxy on 15/11/4.
//  Copyright © 2015年 ZCST. All rights reserved.
//

#import "threeController.h"

@interface threeController ()

@end

@implementation threeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"3";
    self.view.backgroundColor = [UIColor brownColor];
    self.threeH = 100;
    
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(click:) name:@"click" object:nil];
}
- (void)click:(NSNotification *)notification
{
    NSDictionary *dict = [notification userInfo];
    self.ID = dict[@"name"];
    
    NSLog(@"selfID%@",self.ID);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"3";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.textLabel.text = @"我是第3个";
    }
    
    return cell;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
