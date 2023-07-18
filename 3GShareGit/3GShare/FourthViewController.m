//
//  FourthViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/12.
//

#import "FourthViewController.h"
#import "HuodongTableViewCell.h"
#define wechatBackgroundColor [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0]
@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = wechatBackgroundColor;
    ///===/////
    CGFloat red = 80.0 / 255.0;
    CGFloat green = 142.0 / 255.0;
    CGFloat blue = 220.0 / 255.0;
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    //修改状态栏颜色
    UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
    
    [appearance configureWithOpaqueBackground];
    //newblue为自己设定的颜色
    appearance.backgroundColor = newColor;
    
    appearance.shadowColor = [UIColor clearColor];
    
    self.navigationController.navigationBar.standardAppearance = appearance;
    
    self.navigationController.navigationBar.scrollEdgeAppearance = self.navigationController.navigationBar.standardAppearance;
    
    self.navigationController.navigationBar.backgroundColor = newColor;
    
    // 创建一个可变字典来存储导航栏标题的样式属性
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];
    
    //新建一个label来让字体变成白色
    UILabel *titlelabel = [[UILabel alloc] init];
    titlelabel.text = @"活动";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titlelabel;
    
    // 设置导航栏标题的样式
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
    //=======
    
    //==
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

    [_tableView registerClass:[HuodongTableViewCell class] forCellReuseIdentifier:@"huodong"];
    //==
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

//==================这四个函数必须一起出现才能修改间隔，缺一不可======================
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 100)];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 100)];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}
//==================这四个函数必须一起出现才能修改间隔，缺一不可======================


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HuodongTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"huodong" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        UIImage *image = [UIImage imageNamed:@"haibao1.webp"];
        cell.p.image = image;
        cell.label.text = @"I'm lovin' it. - McDonald's";
    } else if (indexPath.section == 1) {
        UIImage *image = [UIImage imageNamed:@"haibao2.webp"];
        cell.p.image = image;
        cell.label.text = @"Think Different. - Apple";
    } else {
        UIImage *image = [UIImage imageNamed:@"haibao3.jpeg"];
        cell.p.image = image;
        cell.label.text = @"Impossible is Nothing. - Adidas";

    }
    cell.label.font = [UIFont systemFontOfSize:12.0];
    cell.label.textAlignment = NSTextAlignmentLeft;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}


@end
