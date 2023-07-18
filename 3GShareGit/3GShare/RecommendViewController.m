//
//  RecommendViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/12.
//

#import "RecommendViewController.h"
#import "ScrollerTableViewCell.h"
#import "ShareTableViewCell.h"
#import "SelectShareViewController.h"
@interface RecommendViewController ()

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //自定义颜色
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
    
    self.navigationItem.title = @"SHARE";
    // 创建一个可变字典来存储导航栏标题的样式属性
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];
    
    //新建一个label来让字体变成白色
    UILabel *titlelabel = [[UILabel alloc] init];
    titlelabel.text = @"SHARE";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titlelabel;
    
    // 设置导航栏标题的样式
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
    
    
    //================tableview视图=====================
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.contentInset = UIEdgeInsetsMake(-40, 0, 0, 0);//去除顶部空白
    UIColor *wechatBackgroundColor = [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0];
    self.tableView.backgroundColor = wechatBackgroundColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];
    
    //========================================
    
    //===================设置标题数组=====================
    _arrayData = @[@[@"假日", @"share小白", @"原创-插画-练习写作", @"15分钟前"],
            @[@"国外画册欣赏", @"share小x", @"平面设计--画册设计", @"15分钟前"],
            @[@"colletion扁平设计", @"share小坤", @"平面设计--海报设计", @"17分钟前"],
            @[@"iOS开发——自定义cell", @"share小虾", @"平面设计--样式设计", @"20分钟前"]];
    //===================设置标题数组=====================
    [_tableView registerClass:[ScrollerTableViewCell class] forCellReuseIdentifier:@"scroller"];
    [_tableView registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"share"];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        ShareTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"share" forIndexPath:indexPath];
        cell.titleLabel.text = _arrayData[indexPath.section ][0];
        cell.labelFirst.text = _arrayData[indexPath.section][1];
        cell.labelSecond.text = _arrayData[indexPath.section][2];
        cell.labelThird.text = _arrayData[indexPath.section][3];
        cell.backgroundColor = [UIColor whiteColor];//解决办法：初始化时随意调用下contentview，比如背景色
        // 通过调用颜色来实现点击事件，与懒加载有关
        
        NSString *listName = [NSString stringWithFormat:@"list_img%ld.png", indexPath.section + 1];
        UIImage *list = [UIImage imageNamed:listName];
        list = [list imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        cell.pictureView.image = list;
        
        [cell.btn1 addTarget:self action:@selector(GoodButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn2 addTarget:self action:@selector(ViewButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn3 addTarget:self action:@selector(ShareButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

        return cell;
}

- (void)GoodButtonTapped:(UIButton *)btn {
    if (btn.tag == 101) {
        btn.tag++;
        [btn setTitle:@"102" forState:UIControlStateNormal];
    } else {
        btn.tag--;
        [btn setTitle:@"101" forState:UIControlStateNormal];
    }
    _zan = btn.titleLabel.text;
}

- (void)ViewButtonTapped:(UIButton *)btn {
    if (btn.tag == 101) {
        btn.tag++;
        [btn setTitle:@"51" forState:UIControlStateNormal];
    } else {
        btn.tag--;
        [btn setTitle:@"50" forState:UIControlStateNormal];
    }
    _kan = btn.titleLabel.text;
}

- (void)ShareButtonTapped:(UIButton *)btn {
    if (btn.tag == 101) {
        btn.tag++;
        [btn setTitle:@"45" forState:UIControlStateNormal];
    } else {
        btn.tag--;
        [btn setTitle:@"44" forState:UIControlStateNormal];
    }
    _share = btn.titleLabel.text;
}

//实现自定义cell的点击事件

-(void)unselectCell:(id)sender{
[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        SelectShareViewController *select = [[SelectShareViewController alloc] init];
        select.zan_chuan = _zan;
        select.kan_chuan = _kan;
        select.share_chuan = _share;
        [self.navigationController pushViewController:select animated:YES];
    }
    //点击后消失
    [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:0.5];

}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 180;
    } else {
        return 150;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 10;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}



\
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
