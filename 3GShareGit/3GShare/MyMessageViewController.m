//
//  MyMessageViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/17.
//

#import "MyMessageViewController.h"
#import "MyMessageTableViewCell.h"
#import "GuanzhuViewController.h"
#import "LetterViewController.h"
#import "ChatViewController.h"
#define wechatBackgroundColor [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0]
@interface MyMessageViewController ()

@end

@implementation MyMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrayData =@[@"评论", @"推荐我的", @"新关注的", @"私信", @"活动通知"];
    
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
    titlelabel.text = @"我的信息";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:18];
    self.navigationItem.titleView = titlelabel;
    
    // 设置导航栏标题的样式
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
    //=======}
    
    //=======
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[MyMessageTableViewCell class] forCellReuseIdentifier:@"mymessage"];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setImage:[UIImage imageNamed:@"back_img.png"] forState:UIControlStateNormal];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
//    保存关注
}

- (void)pressback {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return 5;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

//==================这四个函数必须一起出现才能修改间隔，缺一不可======================
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 10;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 10;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 100)];
//    headerView.backgroundColor = [UIColor clearColor];
//    return headerView;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 100)];
//    footerView.backgroundColor = [UIColor clearColor];
//    return footerView;
//}
//==================这四个函数必须一起出现才能修改间隔，缺一不可======================


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MyMessageTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"mymessage" forIndexPath:indexPath];
        cell.name.text = _arrayData[indexPath.row];
        cell.backgroundColor = [UIColor whiteColor];//解决办法：初始化时随意调用下contentview，比如背景色
        // 通过调用颜色来实现点击事件，与懒加载有关
        if (indexPath.row == 0) {
            [cell.btn setTitle:@"7" forState:UIControlStateNormal];
        } if (indexPath.row == 1) {
            [cell.btn setTitle:@"9" forState:UIControlStateNormal];
        } if (indexPath.row == 2) {
            [cell.btn setTitle:@"5" forState:UIControlStateNormal];
        } if (indexPath.row == 3) {
            [cell.btn setTitle:@"4" forState:UIControlStateNormal];
        } if (indexPath.row == 4) {
            [cell.btn setTitle:@"1" forState:UIControlStateNormal];
        }
        
        CALayer *separatorLayer = [CALayer layer];
        separatorLayer.frame = CGRectMake(0, 40, self.view.frame.size.width - 10, 1); // 修改宽度，减去左右边距
        UIColor *separatorColor = [UIColor colorWithWhite:0.90 alpha:1.0];
        separatorLayer.backgroundColor = separatorColor.CGColor;
        [cell.contentView.layer addSublayer:separatorLayer]; // 添加到contentView的layer上
        
        return cell;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:0.5];

    if (indexPath.row == 0) {
        self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"目前没有新内容" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //====
        }];
        [self.alert addAction:confirmAction];
        [self presentViewController:self.alert animated:YES completion:nil];
    }
    if (indexPath.row == 1) {
        self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"目前没有新内容" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //====
        }];
        [self.alert addAction:confirmAction];
        [self presentViewController:self.alert animated:YES completion:nil];
    }
    if (indexPath.row == 2) {
        //如何保存pop的界面，这里很重要，只要对该谈出的视图控制器进行强引用，然后只创建一次，类似于单例模式
        if (!_guanzhu)
        _guanzhu = [[GuanzhuViewController alloc] init];
//        [self.navigationController pushViewController:t animated:YES];
        // 重新将返回页面的视图控制器添加到导航栈中
        [self.navigationController pushViewController:self.guanzhu animated:YES];
    }
    if (indexPath.row == 3) {
        //如何保存pop的界面，这里很重要，只要对该谈出的视图控制器进行强引用，然后只创建一次，类似于单例模式
        LetterViewController *t = [[LetterViewController alloc] init];
        // 重新将返回页面的视图控制器添加到导航栈中
        [self.navigationController pushViewController:t animated:YES];
    }
    if (indexPath.row == 4) {
        self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"目前没有新内容" preferredStyle:UIAlertControllerStyleAlert];
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
