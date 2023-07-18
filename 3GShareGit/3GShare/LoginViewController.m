//
//  LoginViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/8.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景
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
    kaijiLogoView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 140, 100, 100);
    [backgroundImageView addSubview:kaijiLogoView];
    
    //share字体
    UILabel *share = [[UILabel alloc] init];
    share.text = @"SHARE";
    share.textColor = [UIColor whiteColor];
    share.frame =CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 80, 240, 160, 100);
    share.font = [UIFont fontWithName:@"Superclarendon-BlackItalic" size:35];
    [backgroundImageView addSubview:share];
    
    //文本框
    self.textField1 = [[UITextField alloc]init];
    self.textField1.frame = CGRectMake(60, 350, 280, 40);
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
    self.textField2.frame = CGRectMake(60, 400, 280, 40);
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
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginBtn.frame = CGRectMake(80, 480, 80, 40);
    loginBtn.layer.cornerRadius = loginBtn.frame.size.height / 6.0;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.borderWidth = 2.0;
    loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    loginBtn.tintColor = [UIColor whiteColor];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [backgroundImageView addSubview:loginBtn];
    
    UIButton *registeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registeBtn.frame = CGRectMake(233, 480, 80, 40);
    registeBtn.layer.cornerRadius = registeBtn.frame.size.height / 6.0;
    registeBtn.layer.masksToBounds = YES;
    registeBtn.layer.borderWidth = 2.0;
    registeBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [registeBtn setTitle:@"注册" forState:UIControlStateNormal];
    registeBtn.tintColor = [UIColor whiteColor];
    registeBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    //添加注册时间
    [registeBtn addTarget:self action:@selector(registe) forControlEvents:UIControlEventTouchUpInside];
    [backgroundImageView addSubview:registeBtn];
    
    //自动登录
    UIButton *autoLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    autoLogin.frame = CGRectMake(60, 538, 20, 20);
    autoLogin.imageView.frame = CGRectMake(0, 0, 20, 20);
    UIImage *uncheckedImage = [UIImage imageNamed:@"unchecked1.png"];
    UIImage *checkedImage = [UIImage imageNamed:@"checked1.png"];
    checkedImage = [checkedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    uncheckedImage = [uncheckedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [autoLogin setImage:uncheckedImage forState:UIControlStateNormal];
    autoLogin.tag = 101;
    [autoLogin addTarget:self action:@selector(autoLoginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundImageView addSubview:autoLogin];
    UILabel *autoLabel = [[UILabel alloc] init];
    autoLabel.text = @"自动登录";
    autoLabel.frame = CGRectMake(80, 538, 100, 20);
    autoLabel.textColor = [UIColor blueColor];
    [backgroundImageView addSubview:autoLabel];
    
}

//登陆函数
- (void)login {

    int boo1 = 0;
    for (int i = 0; i < _accoutArray.count; i ++) {
        if ([_accoutArray[i] isEqualToString:_textField1.text] && [_passwordArray[i] isEqualToString:_textField2.text]) {
            boo1 = 1;
            break;
        }
    }
    
        if (boo1 == 1) {
            self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"登陆成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //跳转页面
                FirstViewController *vcFirst = [[FirstViewController alloc] init];
                UIImage *vcFirst_normalImage = [UIImage imageNamed:@"button1_normal.png"];
                vcFirst_normalImage = [vcFirst_normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UIImage *vcFirst_pressImage = [UIImage imageNamed:@"button1_pressed.png"];
                vcFirst_pressImage = [vcFirst_pressImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UITabBarItem *vcFirstIcon = [[UITabBarItem alloc] initWithTitle:@"" image:vcFirst_normalImage selectedImage:vcFirst_pressImage];
                vcFirst.tabBarItem = vcFirstIcon;
                UINavigationController *navFirst = [[UINavigationController alloc]initWithRootViewController:vcFirst];
                
                SecondViewController *vcSecond = [[SecondViewController alloc] init];
                UIImage *vcSecond_normalImage = [UIImage imageNamed:@"button2_normal.png"];
                vcSecond_normalImage = [vcSecond_normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UIImage *vcSecond_pressImage = [UIImage imageNamed:@"button2_pressed.png"];
                vcSecond_pressImage = [vcSecond_pressImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UITabBarItem *vcSecondIcon = [[UITabBarItem alloc] initWithTitle:@"" image:vcSecond_normalImage selectedImage:vcSecond_pressImage];
                vcSecond.tabBarItem = vcSecondIcon;
                UINavigationController *navSecond = [[UINavigationController alloc]initWithRootViewController:vcSecond];

                
                ThirdViewController *vcThird = [[ThirdViewController alloc] init];
                UIImage *vcThird_normalImage = [UIImage imageNamed:@"button3_normal.png"];
                vcThird_normalImage = [vcThird_normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UIImage *vcThird_pressImage = [UIImage imageNamed:@"button3_pressed.png"];
                vcThird_pressImage = [vcThird_pressImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UITabBarItem *vcThirdIcon = [[UITabBarItem alloc] initWithTitle:@"" image:vcThird_normalImage selectedImage:vcThird_pressImage];
                vcThird.tabBarItem = vcThirdIcon;
                UINavigationController *navThird = [[UINavigationController alloc]initWithRootViewController:vcThird];
                
                FourthViewController *vcFourth = [[FourthViewController alloc] init];
                UIImage *vcFourth_normalImage = [UIImage imageNamed:@"button4_normal.png"];
                vcFourth_normalImage = [vcFourth_normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UIImage *vcFourth_pressImage = [UIImage imageNamed:@"button4_pressed.png"];
                vcFourth_pressImage = [vcFourth_pressImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UITabBarItem *vcFourthIcon = [[UITabBarItem alloc] initWithTitle:@"" image:vcFourth_normalImage selectedImage:vcFourth_pressImage];
                vcFourth.tabBarItem = vcFourthIcon;
                UINavigationController *navFourth = [[UINavigationController alloc]initWithRootViewController:vcFourth];
                
                FifthViewController *vcFifth = [[FifthViewController alloc] init];
                UIImage *vcFifth_normalImage = [UIImage imageNamed:@"button5_normal.png"];
                vcFifth_normalImage = [vcFifth_normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UIImage *vcFifth_pressImage = [UIImage imageNamed:@"button5_pressed.png"];
                vcFifth_pressImage = [vcFifth_pressImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UITabBarItem *vcFifthIcon = [[UITabBarItem alloc] initWithTitle:@"" image:vcFifth_normalImage selectedImage:vcFifth_pressImage];
                vcFifth.tabBarItem = vcFifthIcon;
                UINavigationController *navFifth = [[UINavigationController alloc]initWithRootViewController:vcFifth];
                
                UITabBarController *tabBarController = [[UITabBarController alloc] init];
                tabBarController.viewControllers = @[navFirst, navSecond, navThird, navFourth, navFifth];
                tabBarController.selectedIndex = 0;
                
                tabBarController.tabBar.tintColor = [UIColor redColor]; // 设置选中的 TabBarItem 颜色
                tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
                tabBarController.modalPresentationStyle = 0;
                [self presentViewController:tabBarController animated:YES completion:nil];
                //
            }];
            [self.alert addAction:confirmAction];
            [self presentViewController:self.alert animated:YES completion:nil];
        } else {
            self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名或密码错误" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }];
            [self.alert addAction:confirmAction];
            [self presentViewController:self.alert animated:YES completion:nil];
        }
    }

//协议传值
- (void)confirm:(NSMutableArray *)account password:(NSMutableArray *)password {
    self.view.backgroundColor = [UIColor redColor];
    _accoutArray = [NSMutableArray arrayWithArray:account];
    _passwordArray = [NSMutableArray arrayWithArray:password];
}

//注册视图
- (void)registe {
    if (!_rVC)
    _rVC = [[RegisterViewController alloc] init];
//        [self.navigationController pushViewController:t animated:YES];
    // 重新将返回页面的视图控制器添加到导航栈中
//    [self.navigationController pushViewController:self.guanzhu animated:YES];//    //铺满全屏
//    rVC.modalPresentationStyle = 0;
    _rVC.delegate = self;
//    _rVC.sendAccoutArray = _accoutArray;
//    _rVC.passwordArray = _passwordArray;
    [self presentViewController:_rVC animated:YES completion:nil];
}

//点击空白处回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //使虚拟键盘回收，不再作为第一消息响应者
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];
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

- (void)autoLoginButtonTapped:(UIButton *)btn {
    if (btn.tag == 101) {
        btn.tag++;

        UIImage *checkedImage = [UIImage imageNamed:@"checked1.png"];
        checkedImage = [checkedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [btn setImage:checkedImage forState:UIControlStateNormal];
    } else {
        btn.tag--;
        UIImage *uncheckedImage = [UIImage imageNamed:@"unchecked1.png"];
        uncheckedImage = [uncheckedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [btn setImage:uncheckedImage forState:UIControlStateNormal];
    }
}

@end
