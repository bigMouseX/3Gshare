//
//  RegisterViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/11.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化账号密码数组
    _passwordArray = [[NSMutableArray alloc] init];
    _accoutArray = [[NSMutableArray alloc] init];
    
    UIImage *kaijiImage = [UIImage imageNamed:@"kaiji1.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundImageView.image = kaijiImage;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImageView.clipsToBounds = YES;
    [self.view addSubview:backgroundImageView];
    
    //logo
    UIImage *kaijiLogo = [UIImage imageNamed:@"kaiji_logo.psd"];
    UIImageView *kaijiLogoView = [[UIImageView alloc] init];
    kaijiLogoView.image = kaijiLogo;
    kaijiLogoView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 100, 100, 100);
    [backgroundImageView addSubview:kaijiLogoView];
    
    //share字体
    UILabel *share = [[UILabel alloc] init];
    share.text = @"SHARE";
    share.textColor = [UIColor whiteColor];
    share.frame =CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 80, 200, 160, 100);
    share.font = [UIFont fontWithName:@"Superclarendon-BlackItalic" size:35];
    [backgroundImageView addSubview:share];
    
    //文本框
    self.textField1 = [[UITextField alloc]init];
    self.textField1.frame = CGRectMake(60, 310, 280, 40);
    self.textField1.placeholder = @"请输入账号";
    self.textField1.borderStyle = UITextBorderStyleRoundedRect;
    // 设置文本框的圆角
    self.textField1.layer.cornerRadius = self.textField1.bounds.size.height / 2.0;
    self.textField1.layer.masksToBounds = YES;
    self.textField1.backgroundColor = [UIColor whiteColor];  // 设置背景颜色
    self.textField1.layer.borderColor = [UIColor whiteColor].CGColor;  // 设置边框颜色
    self.textField1.layer.borderWidth = 1.0;  // 设置边框宽度
    [self.textField1 becomeFirstResponder];
    [backgroundImageView endEditing:YES];
    backgroundImageView.userInteractionEnabled = YES;
    self.textField1.delegate = self;
    //设置起始图标
    //左侧图标容器
    UIView *leftUserViewContainer1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 42, 40)];
    //1
    UIImageView *firstIconImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    firstIconImageView1.image = [UIImage imageNamed:@"user_img.png"];
    [leftUserViewContainer1 addSubview:firstIconImageView1];
    UIImageView *secondIconImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 5, 2, 30)];
    //2
    secondIconImageView1.image = [UIImage imageNamed:@"home_line.png"];
    [leftUserViewContainer1 addSubview:secondIconImageView1];
    self.textField1.leftView = leftUserViewContainer1;
    self.textField1.leftViewMode = UITextFieldViewModeAlways;
    [backgroundImageView addSubview:self.textField1];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    self.textField2 = [[UITextField alloc]init];
    self.textField2.frame = CGRectMake(60, 360, 280, 40);
    self.textField2.placeholder = @"请输入密码";
    self.textField2.borderStyle = UITextBorderStyleRoundedRect;
    // 设置文本框的圆角
    self.textField2.layer.cornerRadius = self.textField2.bounds.size.height / 2.0;
    self.textField2.layer.masksToBounds = YES;
    self.textField2.backgroundColor = [UIColor whiteColor];  // 设置背景颜色
    self.textField2.layer.borderColor = [UIColor whiteColor].CGColor;  // 设置边框颜色
    self.textField2.layer.borderWidth = 1.0;  // 设置边框宽度
    self.textField2.secureTextEntry = YES;
    [self.textField2 becomeFirstResponder];
    [backgroundImageView endEditing:YES];
    backgroundImageView.userInteractionEnabled = YES;
    //设置起始图标
    //左侧图标容器
    UIView *leftUserViewContainer2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 42, 40)];
    //1
    UIImageView *firstIconImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    firstIconImageView2.image = [UIImage imageNamed:@"pass_img.png"];
    [leftUserViewContainer2 addSubview:firstIconImageView2];
    UIImageView *secondIconImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 5, 2, 30)];
    //2
    secondIconImageView2.image = [UIImage imageNamed:@"home_line.png"];
    [leftUserViewContainer2 addSubview:secondIconImageView2];
    self.textField2.leftView = leftUserViewContainer2;
    self.textField2.leftViewMode = UITextFieldViewModeAlways;
    self.textField2.delegate = self;
    [backgroundImageView addSubview:self.textField2];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    self.textField3 = [[UITextField alloc]init];
    self.textField3.frame = CGRectMake(60, 410, 280, 40);
    self.textField3.placeholder = @"请输入邮箱";
    self.textField3.borderStyle = UITextBorderStyleRoundedRect;
    // 设置文本框的圆角
    self.textField3.layer.cornerRadius = self.textField3.bounds.size.height / 2.0;
    self.textField3.layer.masksToBounds = YES;
    self.textField3.backgroundColor = [UIColor whiteColor];  // 设置背景颜色
    self.textField3.layer.borderColor = [UIColor whiteColor].CGColor;  // 设置边框颜色
    self.textField3.layer.borderWidth = 1.0;  // 设置边框宽度
    [self.textField3 becomeFirstResponder];
    [backgroundImageView endEditing:YES];
    backgroundImageView.userInteractionEnabled = YES;
    self.textField3.delegate = self;
    //设置起始图标
    //左侧图标容器
    UIView *leftUserViewContainer3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 42, 40)];
    //1
    UIImageView *firstIconImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    firstIconImageView3.image = [UIImage imageNamed:@"email_img.png"];
    [leftUserViewContainer3 addSubview:firstIconImageView3];
    UIImageView *secondIconImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(40, 5, 2, 30)];
    //2
    secondIconImageView3.image = [UIImage imageNamed:@"home_line.png"];
    [leftUserViewContainer3 addSubview:secondIconImageView3];
    self.textField3.leftView = leftUserViewContainer3;
    self.textField3.leftViewMode = UITextFieldViewModeAlways;
    [backgroundImageView addSubview:self.textField3];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    //确认注册按钮
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [confirmBtn setTitle:@"确认注册" forState:UIControlStateNormal];
    confirmBtn.tintColor = [UIColor whiteColor];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    confirmBtn.frame = CGRectMake(150, 500, 100, 40);
    confirmBtn.layer.cornerRadius = confirmBtn.frame.size.height / 6.0;
//    confirmBtn.layer.masksToBounds = YES;
    confirmBtn.layer.borderWidth = 2.0;
    confirmBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [confirmBtn addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
    [backgroundImageView addSubview:confirmBtn];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //使虚拟键盘回收，不再作为第一消息响应者
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];
    [self.textField3 resignFirstResponder];
}

- (void)confirm{
    _t = 1;
    for (int i = 0; i < _accoutArray.count; i++) {
        if ([_textField1.text isEqualToString:_accoutArray[i]]) {
            self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名已被注册" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [self.alert addAction:confirmAction];
            [self presentViewController:self.alert animated:YES completion:nil];
            return;
        }
    }
    if (_t == 1) {
        [_accoutArray addObject:_textField1.text];
        [_passwordArray addObject:_textField2.text];
        [self.delegate confirm:_accoutArray password:_passwordArray];
        //提示框
        self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [self.alert addAction:confirmAction];
        [self presentViewController:self.alert animated:YES completion:nil];
    }
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

- (void)keyboardWillShow:(NSNotification *)notification {

    // 在此处进行界面上移的操作
    // 可以通过修改视图的 frame 或者使用动画来实现界面上移
    self.view.frame = CGRectMake(0, -80, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)keyboardWillHide:(NSNotification *)notification {
    // 在此处进行界面恢复的操作
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

@end
