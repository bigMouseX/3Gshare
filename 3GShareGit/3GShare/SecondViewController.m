//
//  SecondViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/12.
//

#import "SecondViewController.h"
#import "DabaiViewController.h"
#import "UpLoadViewController.h"
@interface SecondViewController ()
#define newColor [UIColor colorWithRed:50.0 / 255.0 green:142.0 / 255.0 blue:220.0 / 255.0 alpha:1.0]     //自定义颜色
#define wechatBackgroundColor [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0]
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ======================设置导航栏标题的样式=================
    //自定义颜色
    
    //修改状态栏颜色
    UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
    
    [appearance configureWithOpaqueBackground];
    //newblue为自己设定的颜色
    appearance.backgroundColor = newColor;
    
    appearance.shadowColor = [UIColor clearColor];
    
    self.navigationController.navigationBar.standardAppearance = appearance;
    
    self.navigationController.navigationBar.scrollEdgeAppearance = self.navigationController.navigationBar.standardAppearance;
    
    self.navigationController.navigationBar.backgroundColor = newColor;
    
    //新建一个label来让字体变成白色
    UILabel *titlelabel = [[UILabel alloc] init];
    titlelabel.text = @"搜索";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titlelabel;
    
    self.view.backgroundColor = wechatBackgroundColor;
    
    // ======================设置导航栏标题的样式=================
    //
    
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
    
    //=================上传====================
    UIButton *btnUp = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnUp setImage:[UIImage imageNamed:@"img2.png"] forState:UIControlStateNormal];
    [btnUp addTarget:self action:@selector(pressUpLoad) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *upLoad = [[UIBarButtonItem alloc] initWithCustomView:btnUp];
    self.navigationItem.rightBarButtonItem = upLoad;
    //=================上传===================
    
    //标签
    _arrayData = @[@[@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟与设计", @"影视", @"摄影", @"其他"],
                    @[@"人气最高", @"收藏最多", @"评论最多", @"编辑精选"],
                      @[@"30分钟前", @"一小时前", @"一月前", @"一年前"]];
    
    //第一个
    UIButton *btnFirst = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *imageBiaoqian = [UIImage imageNamed:@"biaoqian.png"];
    btnFirst.frame = CGRectMake(5, 160, 60, 40);
    [btnFirst setImage:imageBiaoqian forState:UIControlStateNormal];
    [btnFirst setTitle:@"分类" forState:UIControlStateNormal];
    btnFirst.tintColor = [UIColor whiteColor];
    btnFirst.backgroundColor = newColor;
    //图片与文字都靠左
    btnFirst.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.view addSubview:btnFirst];
    
    //分割线
    CALayer *separatorLayer = [CALayer layer];
    separatorLayer.frame = CGRectMake(5, 202, self.view.frame.size.width - 5, 2); // 修改宽度，减去左右边距
    UIColor *separatorColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    separatorLayer.backgroundColor = separatorColor.CGColor;
    [self.view.layer addSublayer:separatorLayer]; // 添加到视图的layer上
    
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:_arrayData[0][i] forState:UIControlStateNormal];
        [btn setTitle:_arrayData[0][i] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = 101;
        btn.frame = CGRectMake(5 + (i * UIScreen.mainScreen.bounds.size.width / 4 ), 210, UIScreen.mainScreen.bounds.size.width / 4 - 5, 30);
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
        btn.frame = CGRectMake(5 + ((i - 4) * UIScreen.mainScreen.bounds.size.width / 4), 210 + 35, UIScreen.mainScreen.bounds.size.width / 4 - 5, 30);
        btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    //第二个
    UIButton *btnSecond = [UIButton buttonWithType:UIButtonTypeSystem];
    btnSecond.frame = CGRectMake(5, 160 + 120, 60, 40);
    [btnSecond setImage:imageBiaoqian forState:UIControlStateNormal];
    [btnSecond setTitle:@"推荐" forState:UIControlStateNormal];
    btnSecond.tintColor = [UIColor whiteColor];
    btnSecond.backgroundColor = newColor;
    //图片与文字都靠左
    btnSecond.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.view addSubview:btnSecond];
    
    //分割线
    CALayer *separatorLayer2 = [CALayer layer];
    separatorLayer2.frame = CGRectMake(5, 202 + 120, self.view.frame.size.width - 5, 2); // 修改宽度，减去左右边距
    separatorLayer2.backgroundColor = separatorColor.CGColor;
    [self.view.layer addSublayer:separatorLayer2]; // 添加到视图的layer上
    
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:_arrayData[1][i] forState:UIControlStateNormal];
        [btn setTitle:_arrayData[1][i] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = 101;
        btn.frame = CGRectMake(5 + (i * UIScreen.mainScreen.bounds.size.width / 4 ), 210 + 120, UIScreen.mainScreen.bounds.size.width / 4 - 5, 30);
        btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    //第三个
    UIButton *btnThird = [UIButton buttonWithType:UIButtonTypeSystem];
    btnThird.frame = CGRectMake(5, 160 + 120 + 85, 60, 40);
    [btnThird setImage:imageBiaoqian forState:UIControlStateNormal];
    [btnThird setTitle:@"推荐" forState:UIControlStateNormal];
    btnThird.tintColor = [UIColor whiteColor];
    btnThird.backgroundColor = newColor;
    //图片与文字都靠左
    btnThird.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.view addSubview:btnThird];
    
    //分割线
    CALayer *separatorLayer3 = [CALayer layer];
    separatorLayer3.frame = CGRectMake(5, 202 + 120 + 85, self.view.frame.size.width - 5, 2); // 修改宽度，减去左右边距
    separatorLayer3.backgroundColor = separatorColor.CGColor;
    [self.view.layer addSublayer:separatorLayer3]; // 添加到视图的layer上
    
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:_arrayData[2][i] forState:UIControlStateNormal];
        [btn setTitle:_arrayData[2][i] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = 101;
        btn.frame = CGRectMake(5 + (i * UIScreen.mainScreen.bounds.size.width / 4 ), 210 + 120 + 85, UIScreen.mainScreen.bounds.size.width / 4 - 5, 30);
        btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}


//======================文本框==============================
//点击空白处回收键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.searchBar resignFirstResponder];// 点击空白处收起
    
}

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
//======================文本框==============================

//======================搜索栏==============================
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if ([searchBar.text isEqualToString:@"大白"]) {
        DabaiViewController *dabai = [[DabaiViewController alloc] init];
        [self.navigationController pushViewController:dabai animated:YES];
    }
}
//======================搜索栏==============================

//======================上传==============================
- (void)pressUpLoad {
    UpLoadViewController *UL = [[UpLoadViewController alloc] init];
//    [self presentViewController:UL animated:YES completion:nil];
    [self.navigationController pushViewController:UL animated:YES];
}
//======================上传==============================

@end
