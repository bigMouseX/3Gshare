//
//  SelectShareViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/15.
//

#import "SelectShareViewController.h"
#import "SelectShareTableViewCell.h"
@interface SelectShareViewController ()

@end

@implementation SelectShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //================主滚动视图=====================
    self.scrollView1 = [[UIScrollView alloc] init];
    self.scrollView1.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    //是否按照整页来滚动
    //是否可以开启滚动效果
    self.scrollView1.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView1.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1150);
    
    
    //是否可以边缘弹动效果
    //这个是比较有用的点，可以让我们第一张与最后一张图片只能向前或向后拉动，而不能向没有图片的方向拉动
    //bounces的意思是弹动
    self.scrollView1.bounces = YES;
    //开启纵向弹动效果
    //一般会开启，但是对于滚动的只有图片不需要刷新的最好不要开启
    self.scrollView1.alwaysBounceVertical = YES;
    //显示横向滚动条
    //    sv.showsHorizontalScrollIndicator = YES;
    //是否显示纵向滚动条
    //必须要画布大小大于滚动视图框架大小才能显示
    self.scrollView1.showsVerticalScrollIndicator = YES;
    //设置背景颜色
    //    UIColor *wechatBackgroundColor = [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0];
    self.scrollView1.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView1];
    //========================================
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 100) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _tableView.contentInset = UIEdgeInsetsMake(-40, 0, 0, 0);//去除顶部空白
    _tableView.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.scrollView1];
    [self.scrollView1 addSubview:_tableView];
    
    _arrayData = @[@[@"假日", @"share小白", @"原创-插画-练习写作", @"15分钟前"],
                   @[@"国外画册欣赏", @"share小x", @"平面设计--画册设计", @"15分钟前"],
                   @[@"colletion扁平设计", @"share小坤", @"平面设计--海报设计", @"17分钟前"],
                   @[@"iOS开发——自定义cell", @"share小虾", @"平面设计--样式设计", @"20分钟前"]];
    [_tableView registerClass:[SelectShareTableViewCell class] forCellReuseIdentifier:@"select"];
    
    UILabel *wenan = [[UILabel alloc] init];
    wenan.text = @"多希望列车能把我带到有你的城市";
    wenan.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];;
    wenan.frame = CGRectMake(5, 105, 400, 15);
    [self.scrollView1 addSubview:wenan];
    
    for (int i = 0; i <= 4; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *str = [NSString stringWithFormat:@"works_img%d.png", i + 1];
        UIImage *image = [UIImage imageNamed:str];
        if (i == 0) {
            imageView.frame = CGRectMake(5, 130, UIScreen.mainScreen.bounds.size.width - 5, 200);
            imageView.image = image;
        } else if (i == 1) {
            imageView.frame = CGRectMake(5, 130 + 205, UIScreen.mainScreen.bounds.size.width - 5, 200);
            imageView.image = image;
        } else if (i == 2) {
            imageView.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width/ 2 - 80, 130 + 205 + 205, 160, 200);
            imageView.image = image;
        } else if (i == 3) {
            imageView.frame = CGRectMake(5, 130 + 3 * 205, UIScreen.mainScreen.bounds.size.width - 5, 200);
            imageView.image = image;
            imageView.image = image;
        } else if (i == 4){
            imageView.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width/ 2 - 80, 130 + 4 * 205, 160, 200);
            imageView.image = image;
        }
        [self.scrollView1 addSubview:imageView];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelectShareTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"select" forIndexPath:indexPath];
    cell.titleLabel.text = _arrayData[indexPath.section][0];
    cell.labelFirst.text = _arrayData[indexPath.section][3];
    cell.labelSecond.text = _arrayData[indexPath.section][1];
    cell.backgroundColor = [UIColor whiteColor];
    
    UIImage *list = [UIImage imageNamed:@"works_head.png"];
    list = [list imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    cell.pictureView.image = list;

    if ([self.zan_chuan isEqualToString:@"101"]) {
        [cell.btn1 setTitle:@"102" forState:UIControlStateNormal];
    } else {
        [cell.btn1 setTitle:@"101" forState:UIControlStateNormal];

    }
    if ([self.kan_chuan isEqualToString:@"50"]) {
        [cell.btn2 setTitle:@"51" forState:UIControlStateNormal];
    } else {
        [cell.btn2 setTitle:@"50" forState:UIControlStateNormal];

    }
    if ([self.share_chuan isEqualToString:@"44"]) {
        [cell.btn3 setTitle:@"45" forState:UIControlStateNormal];
    } else {
        [cell.btn3 setTitle:@"44" forState:UIControlStateNormal];

    }
    
    
    //分割线
    CALayer *separatorLayer = [CALayer layer];
    separatorLayer.frame = CGRectMake(5, 100, self.view.frame.size.width - 10, 1); // 修改宽度，减去左右边距
    UIColor *separatorColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    separatorLayer.backgroundColor = separatorColor.CGColor;
    [cell.contentView.layer addSublayer:separatorLayer]; // 添加到contentView的layer上

    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

//实现自定义cell的点击事件
-(void)unselectCell:(id)sender{
[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {

    }
    //点击后消失
    [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:0.5];

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
