//
//  ViewController.m
//  TableViewRowActionTest
//
//  Created by GHl on 16/6/3.
//  Copyright © 2016年 jiaozhenlong. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewRowAction+GHExtension.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSMutableArray*  array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.array = [NSMutableArray arrayWithObjects:@"总是得到很多",@"多到麻木自我",@"竟然差一点就忘记",@"手掌里要有更多呼吸",@"曾经失去很多",@"多到放弃自我",@"黄昏最后一盏灯亮起",@"来得及撑开眼睛",@"地球偶尔太大去练习",@"沙滩上海浪留下痕迹",@"剩下心和自己有时太安静",@"自己都不敢看自己", nil];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17], NSKernAttributeName:@10.0f,NSForegroundColorAttributeName:[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1]
                          };
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:cell.textLabel.text attributes:dic];
    cell.textLabel.attributedText = attributeStr;
    return cell;
}
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault image:[UIImage imageNamed:@"11"] handler:^(UITableViewRowAction * _Nullable action, NSIndexPath * _Nullable indexPath) {
        NSLog(@"点击了action2---刷新");
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        
    }];
      action1.backgroundColor = [UIColor clearColor];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault image:[UIImage imageNamed:@"22"] handler:^(UITableViewRowAction * _Nullable action, NSIndexPath * _Nullable indexPath) {
        NSLog(@"点击了action1---删除");
        [self.array removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];

    }];
      action2.backgroundColor = [UIColor clearColor];
    
    
    UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault image:[UIImage imageNamed:@"33"] handler:^(UITableViewRowAction * _Nullable action, NSIndexPath * _Nullable indexPath) {
        NSLog(@"点击了action3---更多");
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }];
      action3.backgroundColor = [UIColor clearColor];
    return @[action1,action2,action3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
