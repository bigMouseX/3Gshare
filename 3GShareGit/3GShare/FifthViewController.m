//
//  FifthViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/12.
//

#import "FifthViewController.h"
#import "HuodongTableViewCell.h"
#import "ShareTableViewCell.h"
#import "SelfHeadTableViewCell.h"
#import "SelfMessageTableViewCell.h"
#import "SelfUpLoadViewController.h"
#import "MyMessageViewController.h"
#import "GuanzhuViewController.h"
#import "RecommendViewController.h"
#import "SetViewController.h"
#define wechatBackgroundColor [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0]
@interface FifthViewController ()

@end

@implementation FifthViewController

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
    titlelabel.text = @"个人信息";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titlelabel;
    
    // 设置导航栏标题的样式
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
    //=======}
    
    //=======
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

    _arrayData =@[@[@"我上传的", @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出"]];
    
    [_tableView registerClass:[SelfHeadTableViewCell class] forCellReuseIdentifier:@"selfhead"];
    [_tableView registerClass:[SelfMessageTableViewCell class] forCellReuseIdentifier:@"selfmessage"];
    //=======
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 6;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 150;
    } else {
        return 60;
    }
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
    if (indexPath.section == 0) {
        SelfHeadTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"selfhead" forIndexPath:indexPath];
        cell.titleLabel.text = @"share小白";
        cell.labelFirst.text = @"数媒/设计爱好者";
        cell.labelSecond.text = @"";
        cell.labelThird.text = @"我爱华为";
        cell.backgroundColor = [UIColor whiteColor];//解决办法：初始化时随意调用下contentview，比如背景色
        // 通过调用颜色来实现点击事件，与懒加载有关
        
        NSString *listName = [NSString stringWithFormat:@"headPhoto5.jpg"];
        UIImage *list = [UIImage imageNamed:listName];
        list = [list imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        cell.pictureView.frame = CGRectMake(30, 30, 100, 100);
        cell.pictureView.image = list;

        return cell;
    } else {
        SelfMessageTableViewCell *cellA = [_tableView dequeueReusableCellWithIdentifier:@"selfmessage" forIndexPath:indexPath];
        //每次创建单元格的索引不同
        cellA.name.text = _arrayData[indexPath.section - 1][indexPath.row];
        cellA.name.textColor = [UIColor blackColor];
        
        NSString *t = [NSString stringWithFormat:@"self%ld.png", indexPath.row + 1];
        UIImage *image = [UIImage imageNamed:t];
        cellA.icon.image = image;
        cellA.backgroundColor = [UIColor whiteColor];
        cellA.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cellA;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:0.5];

    if (indexPath.section == 1 && indexPath.row == 0) {
        SelfUpLoadViewController *t = [[SelfUpLoadViewController alloc] init];
        [self.navigationController pushViewController:t animated:YES];
    }
    if (indexPath.section == 1 && indexPath.row == 1) {
        if (!_mm)
        _mm = [[MyMessageViewController alloc] init];
//        [self.navigationController pushViewController:t animated:YES];
        // 重新将返回页面的视图控制器添加到导航栈中
        [self.navigationController pushViewController:self.mm animated:YES];
    }
    if (indexPath.section == 1 && indexPath.row == 2) {
        RecommendViewController *t = [[RecommendViewController alloc] init];
        [self.navigationController pushViewController:t animated:YES];
    }
    if (indexPath.section == 1 && indexPath.row == 3) {
        self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"目前没有新内容" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //====
        }];
        [self.alert addAction:confirmAction];
        [self presentViewController:self.alert animated:YES completion:nil];
    }
    if (indexPath.section == 1 && indexPath.row == 4) {
        SetViewController *t = [[SetViewController alloc] init];
        [self.navigationController pushViewController:t animated:YES];
    }
    if (indexPath.section == 1 && indexPath.row == 5) {
        self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"需求被驳回" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //====
        }];
        [self.alert addAction:confirmAction];
        [self presentViewController:self.alert animated:YES completion:nil];
    }
    
}

-(void)unselectCell:(id)sender{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    }

@end

