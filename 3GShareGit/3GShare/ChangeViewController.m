//
//  ChangeViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/18.
//

#import "ChangeViewController.h"
#import "ChangeTableViewCell.h"
#define wechatBackgroundColor [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0]
@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrayData =@[@"旧密码", @"新密码", @"确认密码"];

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
    titlelabel.text = @"修改密码";
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
    
    [_tableView registerClass:[ChangeTableViewCell class] forCellReuseIdentifier:@"change"];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setImage:[UIImage imageNamed:@"back_img.png"] forState:UIControlStateNormal];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    

    _t1 = [[UITextField alloc] init];
    _t1.frame = CGRectMake(150, 0 * 40, UIScreen.mainScreen.bounds.size.width - 150, 40);
    _t1.placeholder = @"6-20位英文或数字组合";
    _t1.secureTextEntry = YES;
    _t1.delegate = self;
    
    _t2 = [[UITextField alloc] init];
    _t2.frame = CGRectMake(150, 1 * 40, UIScreen.mainScreen.bounds.size.width - 150, 40);
    _t2.placeholder = @"6-20位英文或数字组合";
    _t2.secureTextEntry = YES;
    _t2.delegate = self;
    
    _t3 = [[UITextField alloc] init];
    _t3.frame = CGRectMake(150, 2 * 40, UIScreen.mainScreen.bounds.size.width - 150, 40);
    _t3.placeholder = @"6-20位英文或数字组合";
    _t3.secureTextEntry = YES;
    _t3.delegate = self;

    
    self.t1.borderStyle = UITextBorderStyleRoundedRect;
    self.t2.borderStyle = UITextBorderStyleRoundedRect;
    self.t3.borderStyle = UITextBorderStyleRoundedRect;

    [self.t1 becomeFirstResponder];
    [self.t2 becomeFirstResponder];
    [self.t3 becomeFirstResponder];
    [self.tableView endEditing:YES];
    self.tableView.userInteractionEnabled = YES;
    
    [self.tableView addSubview:_t1];
    [self.tableView addSubview:_t2];
    [self.tableView addSubview:_t3];
//    [self.view endEditing:YES];
//    self.view.userInteractionEnabled = YES;

    UIButton *wancheng = [UIButton buttonWithType:UIButtonTypeSystem];
    wancheng.frame = CGRectMake(100, 300, UIScreen.mainScreen.bounds.size.width - 200, 40);
    wancheng.backgroundColor = newColor;
    [wancheng setTitle:@"提交" forState:UIControlStateNormal];
    [wancheng setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [wancheng addTarget:self action:@selector(wancheng) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:wancheng];
    //完成
}
- (void)wancheng {
    if ([_s2 isEqualToString:_s3]) {
        self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"更改成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //推出导航栏控制器
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [self.alert addAction:confirmAction];
        [self presentViewController:self.alert animated:YES completion:nil];
    } else {
        self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"两次输入密码不一致" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [self.alert addAction:confirmAction];
        [self presentViewController:self.alert animated:YES completion:nil];
    }
}

//点击空白处回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //使虚拟键盘回收，不再作为第一消息响应者
    [self.t1 resignFirstResponder];
    [self.t2 resignFirstResponder];
    [self.t3 resignFirstResponder];
}

//是否可以进行输入
//如果返回值为YES，可以进行输入，默认为YES，
//NO：不能输入文字
//当权限不够可以弹出NO
- (BOOL)textField1ShouldBeginEditing:(UITextField *)textField1 {
    return YES;
}

//是否可以结束输入
//如果返回值为YES，可以结束输入，默认为YES，
//NO：不能结束输入文字，常用于提示用户输入不合法，不合法键盘就不退回去，就得重新修改文本
- (BOOL)textField1ShouldEndEditing:(UITextField *)textField1 {
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == _t1) {
        // t1 文本框的内容
        _s1 = textField.text;
        // 处理 t1 的内容
    } else if (textField == _t2) {
        // t2 文本框的内容
        _s2 = textField.text;
        // 处理 t2 的内容
    } else if (textField == _t3) {
        // t3 文本框的内容
        _s3 = textField.text;
        // 处理 t3 的内容
    }


}


- (void)pressback {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return 3;

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
        ChangeTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"change" forIndexPath:indexPath];
        cell.name.text = _arrayData[indexPath.row];
        cell.backgroundColor = [UIColor whiteColor];//解决办法：初始化时随意调用下contentview，比如背景色
        // 通过调用颜色来实现点击事件，与懒加载有关
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

}

-(void)unselectCell:(id)sender{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    }

@end
