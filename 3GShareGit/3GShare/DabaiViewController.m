//
//  DabaiViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/15.
//

#import "DabaiViewController.h"
#import "ShareTableViewCell.h"
@interface DabaiViewController ()

@end

@implementation DabaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.searchBar = [[UISearchBar alloc]init];
    self.searchBar.frame = CGRectMake(5, 103, UIScreen.mainScreen.bounds.size.width, 40);
    self.searchBar.placeholder = @"搜索 用户名 作文分类 文章";
    [self.searchBar setBarStyle:UIBarStyleDefault];    // 设置文本框的圆角
    self.searchBar.layer.cornerRadius = self.searchBar.bounds.size.height / 2.0;
    self.searchBar.layer.masksToBounds = YES;
    self.searchBar.backgroundColor = [UIColor whiteColor];  // 设置背景颜色
    self.searchBar.layer.borderColor = [UIColor whiteColor].CGColor;  // 设置边框颜色
    self.searchBar.layer.borderWidth = 1.0;  // 设置边框宽度
    //    [self.searchBar becomeFirstResponder];//自动弹出键盘
    [self.view endEditing:YES];
    self.view.userInteractionEnabled = YES;
    self.searchBar.delegate = self;
    
    [self.view addSubview:self.searchBar];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 150, UIScreen.mainScreen.bounds.size.width - 5, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"share"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
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
    ShareTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"share" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        UIImage *image = [UIImage imageNamed:@"dabai1.jpeg"];
        cell.pictureView.image = image;
        cell.titleLabel.text = @"Icon of Baymax";
        cell.labelFirst.text = @"share小白";
        cell.labelSecond.text = @"原创-UI-Icon";
        cell.labelThird.text = @"15分钟前";
    } else {
        UIImage *image = [UIImage imageNamed:@"dabai2.jpeg"];
        cell.pictureView.image = image;
        cell.titleLabel.text = @"每个人都需要有一个自己的大白 ";
        cell.labelFirst.text = @"share小坤";
        cell.labelSecond.text = @"原创作品-摄影";
        cell.labelThird.text = @"一个月前";
    }
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
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
