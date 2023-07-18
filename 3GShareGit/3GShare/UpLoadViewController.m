//
//  UpLoadViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/16.
//

#import "UpLoadViewController.h"
#define wechatBackgroundColor [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0]
#define newColor [UIColor colorWithRed:50.0 / 255.0 green:160.0 / 255.0 blue:220.0 / 255.0 alpha:1.0]     //自定义颜色
@interface UpLoadViewController ()

@end

@implementation UpLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = wechatBackgroundColor;
    
    //==================照片墙按钮===================
    _addPhoto = [UIButton buttonWithType:UIButtonTypeCustom];
    _addPhoto.frame = CGRectMake(5, 110, 250, 170);;
    [_addPhoto setImage:[UIImage imageNamed:@"addPhoto.jpeg"] forState:UIControlStateNormal];
    [_addPhoto addTarget:self action:@selector(changePhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_addPhoto];
    
    //照片数量====
    _total = [[UILabel alloc] init];
    _total.text = @"0";
    
    _total.backgroundColor = [UIColor clearColor];
    _total.frame = CGRectMake(240, 110, 20, 20);
    [self.view addSubview:_total];
    
    //====照片数量
    
    //==================照片墙按钮===================
    
    
    //==========定位
    UIImageView *dingwei = [[UIImageView alloc] init];
    UIImage *dingweiImage = [UIImage imageNamed:@"spiritling-dingwei.png"];
    dingwei.image = dingweiImage;
    dingwei.frame = CGRectMake(270, 160, 20, 20);
    [self.view addSubview:dingwei];
    
    UILabel *dingweiLabel = [[UILabel alloc] init];
    dingweiLabel.frame = CGRectMake(292, 160, 95, 20);
    dingweiLabel.text = @"洛杉矶・理塘市";
    dingweiLabel.layer.cornerRadius = dingweiLabel.bounds.size.height / 2.0;
    dingweiLabel.clipsToBounds = YES;
    dingweiLabel.font = [UIFont systemFontOfSize:13.0];
    dingweiLabel.textColor = [UIColor whiteColor];
    dingweiLabel.backgroundColor = newColor;
    [self.view addSubview:dingweiLabel];
    
    //定位==========
    
    //折叠cell=======
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(270, 200, 95, 80) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _dataArray = [NSMutableArray arrayWithObjects:@"原创作品", @"设计资料", @"设计师观点", @"设计教程", nil];
    [self.view addSubview:_tableView];
    
    _zhedie = [UIButton buttonWithType:UIButtonTypeSystem];
    _zhedie.frame = CGRectMake(270 + 95, 200, 20, 20);
    _zhedie.backgroundColor = newColor;
    [_zhedie setImage:[UIImage imageNamed:@"shou.png"] forState:UIControlStateNormal];
    [_zhedie addTarget:self action:@selector(pressUp:)
     forControlEvents:UIControlEventTouchUpInside];
    _zhedie.tag = 1001;
    [self.view addSubview:_zhedie];
    
    if (_zhedie.tag == 1001) {
        _tableView.frame = CGRectMake(270, 200, 95, 20);
    }
    //=======折叠cell
    
    //====标签
    _arrayData = @[@[@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟与设计", @"影视", @"摄影", @"其他"],
                    @[@"人气最高", @"收藏最多", @"评论最多", @"编辑精选"],
                      @[@"30分钟前", @"一小时前", @"一月前", @"一年前"]];
    
    //第一个

    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:_arrayData[0][i] forState:UIControlStateNormal];
        [btn setTitle:_arrayData[0][i] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = 101;
        btn.frame = CGRectMake(5 + (i * UIScreen.mainScreen.bounds.size.width / 4 ), 300, UIScreen.mainScreen.bounds.size.width / 4 - 5, 30);
        btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    for (int i = 4; i < 8; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:_arrayData[0][i] forState:UIControlStateNormal];
        [btn setTitle:_arrayData[0][i] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = 101;
        btn.frame = CGRectMake(5 + ((i - 4) * UIScreen.mainScreen.bounds.size.width / 4), 300 + 35, UIScreen.mainScreen.bounds.size.width / 4 - 5, 30);
        btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    //标签====
    
    //输入
    _textFieldFirst = [[UITextField alloc] init];
    _textFieldFirst.frame = CGRectMake(10, 370, self.view.bounds.size.width - 20, 30);
    _textFieldFirst.placeholder = @"作品设计";
    _textFieldFirst.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    self.view.userInteractionEnabled = YES;
    _textFieldFirst.delegate = self;
    [_textFieldFirst becomeFirstResponder];
    [self.view addSubview:_textFieldFirst];
    
    _textFieldSecond = [[UITextField alloc] init];
    _textFieldSecond.frame = CGRectMake(10, 410, self.view.bounds.size.width - 20, 120);
    _textFieldSecond.placeholder = @"请添加作品说明文章内容";
    _textFieldSecond.backgroundColor = [UIColor whiteColor];
    _textFieldSecond.delegate = self;
    [self.view endEditing:YES];
    self.view.userInteractionEnabled = YES;
    [_textFieldSecond becomeFirstResponder];
    [self.view addSubview:_textFieldSecond];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

    //这个要重点记住，内容的对齐位置
    _textFieldSecond.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;

    //输入
    
    //完成
    UIButton *wancheng = [UIButton buttonWithType:UIButtonTypeSystem];
    wancheng.frame = CGRectMake(10, 540, UIScreen.mainScreen.bounds.size.width - 20, 40);
    wancheng.backgroundColor = newColor;
    [wancheng setTitle:@"完成" forState:UIControlStateNormal];
    [wancheng setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [wancheng addTarget:self action:@selector(wancheng) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wancheng];
    //完成
    
    //下载
    UIButton *autoLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    autoLogin.frame = CGRectMake(10, 585, 20, 20);
    autoLogin.imageView.frame = CGRectMake(0, 0, 20, 20);
    UIImage *uncheckedImage = [UIImage imageNamed:@"unchecked1.png"];
    UIImage *checkedImage = [UIImage imageNamed:@"checked1.png"];
    checkedImage = [checkedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    uncheckedImage = [uncheckedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [autoLogin setImage:uncheckedImage forState:UIControlStateNormal];
    autoLogin.tag = 101;
    [autoLogin addTarget:self action:@selector(autoLoginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:autoLogin];
    UILabel *autoLabel = [[UILabel alloc] init];
    autoLabel.text = @"禁止下崽";
    autoLabel.frame = CGRectMake(32, 585, 100, 20);
    autoLabel.textColor = [UIColor blackColor];
    [self.view addSubview:autoLabel];
    //下载
    
}

- (void)wancheng {
    self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"上传成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //====
    }];
    [self.alert addAction:confirmAction];
    [self presentViewController:self.alert animated:YES completion:nil];
}

- (void)changePhoto {
    PhotoWallViewController *photoWall = [[PhotoWallViewController alloc] init];
    photoWall.delegate = self;
    [self.navigationController pushViewController:photoWall animated:YES];
}
- (void)changePhoto:(UIImage *)image count:(long)a {
    [_addPhoto setImage:image forState:UIControlStateNormal];
    NSString *t = [NSString stringWithFormat:@"%ld", a];
    _total.text = t;
}

//====折叠cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *strID = @"ID";
    //尝试获取可以复用的单元格
    //如果得不到，返回为nil
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:strID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
    }
    //单元格文字赋值
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.section];
    cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;

    return cell;
}



- (void)pressUp:(UIButton *)btn {
    if (btn.tag == 1002) {
        [btn setImage:[UIImage imageNamed:@"shou.png"] forState:UIControlStateNormal];
        _tableView.frame = CGRectMake(270, 200, 95, 20);
        btn.tag--;
    } else {
        [btn setImage:[UIImage imageNamed:@"fang.png"] forState:UIControlStateNormal];
        _tableView.frame = CGRectMake(270, 200, 95, 80);
        btn.tag++;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectedItem = _dataArray[indexPath.section];
    [_dataArray removeObjectAtIndex:indexPath.section];
    [_dataArray insertObject:selectedItem atIndex:0];
    
    [_tableView reloadData];
    [self pressUp:_zhedie];

}

//折叠cell=====

//==标签
- (void)press:(UIButton *)btn {
    if (btn.tag == 101) {
        btn.backgroundColor = newColor;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.tag++;
    } else {
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag--;
    }
}
//标签==

//输入
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_textFieldFirst resignFirstResponder];
    [_textFieldSecond resignFirstResponder];
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
//输入

//下载
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
//下载

@end
