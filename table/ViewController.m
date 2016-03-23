//
//  ViewController.m
//  table
//
//  Created by zxy on 15/11/4.
//  Copyright © 2015年 ZCST. All rights reserved.
//

#import "ViewController.h"
#import "oneController.h"
#import "twoController.h"
#import "threeController.h"
#import "fourController.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;
- (IBAction)segmentChange:(id)sender;
@property (nonatomic,weak) oneController *one;
@property (nonatomic,weak) twoController *two;
@property (nonatomic,weak) threeController *three;
@property (nonatomic,weak) fourController *four;
@property (copy, nonatomic) NSString *ID;
@property (nonatomic,weak) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"主界面";
    oneController *one = [[oneController alloc] init];
    self.one = one;
    
    twoController *two = [[twoController alloc] init];
    threeController *three = [[threeController alloc] init];
    fourController *four = [[fourController alloc] init];
    self.two = two;
    self.three = three;
    self.four = four;
    self.one.ID = self.ID;
    self.two.ID = self.ID;
    self.three.ID = self.ID;
    self.four.ID = self.ID;
    [self addChildViewController:one];
    [self addChildViewController:two];
    [self addChildViewController:three];
    [self addChildViewController:four];
    
    [self.view addSubview:one.tableView];
    [self.view addSubview:two.tableView];
    [self.view addSubview:three.tableView];
    [self.view addSubview:four.tableView];
    
    
    self.ID = @"123";
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"click" object:self userInfo:@{@"name":@"jack",@"sex":@"1"}];
    
    [self segmentChange:0];
}



- (IBAction)segmentChange:(id)sender {
    NSLog(@"%ld",self.seg.selectedSegmentIndex);
    
    
    if (self.seg.selectedSegmentIndex == 0) {
//        [self.view addSubview:self.one.tableView];
        self.one.tableView.hidden = NO;
         [self.btn removeFromSuperview];
        self.one.tableView.frame = CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, self.one.oneH);
        self.two.tableView.hidden = YES;
        self.three.tableView.hidden = YES;
        self.four.tableView.hidden = YES;
        NSLog(@"self %@,one %@",self.ID,self.one.ID);
    }
    else if (self.seg.selectedSegmentIndex == 1){
//        [self.view addSubview:self.two.tableView];
         [self.btn removeFromSuperview];
        self.two.tableView.hidden = NO;
        self.two.tableView.frame = CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, self.two.twoH);
        self.one.tableView.hidden = YES;
        self.three.tableView.hidden = YES;
        self.four.tableView.hidden = YES;
        NSLog(@"self %@,two %@",self.ID,self.two.ID);
    }
    else if (self.seg.selectedSegmentIndex == 2){
//        [self.view addSubview:self.three.tableView];
        [self.btn removeFromSuperview];
        self.three.tableView.hidden = NO;
        self.three.tableView.frame = CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, self.three.threeH);
        self.one.tableView.hidden = YES;
        self.two.tableView.hidden = YES;
        self.four.tableView.hidden = YES;
        NSLog(@"self %@,three %@",self.ID,self.three.ID);
    }
    else if (self.seg.selectedSegmentIndex == 3){
//        [self.view addSubview:self.four.tableView];
        
        UIButton *btn = [[UIButton alloc] init];
        self.btn = btn;
        btn.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 40, [UIScreen mainScreen].bounds.size.width, 40);
        btn.backgroundColor = [UIColor blackColor];
        [self.view addSubview:btn];
        
        
        self.four.tableView.hidden = NO;
        self.four.tableView.frame = CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, self.four.fourH);
        self.two.tableView.hidden = YES;
        self.three.tableView.hidden = YES;
        self.one.tableView.hidden = YES;
        NSLog(@"self %@,four %@",self.ID,self.four.ID);
    }
}
@end
