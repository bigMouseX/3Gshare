//
//  ThirdViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/12.
//

#import "ThirdViewController.h"
#import "ShareTableViewCell.h"
#define wechatBackgroundColor [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0]
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = wechatBackgroundColor;
    //=======
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
    titlelabel.text = @"文章";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titlelabel;
    
    // 设置导航栏标题的样式
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
    //====================
    
    //
    _segControl = [[UISegmentedControl alloc] init];
    _segControl.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, self.navigationController.navigationBar.frame.size.height);
    [_segControl insertSegmentWithTitle:@"精选文章" atIndex:0 animated:NO];
    [_segControl insertSegmentWithTitle:@"热门推荐" atIndex:0 animated:NO];
    [_segControl insertSegmentWithTitle:@"全部文章" atIndex:0 animated:NO];
    [_segControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    _segControl.selectedSegmentIndex = 0;
    
    NSDictionary *normalAttributes = @{
        NSForegroundColorAttributeName: [UIColor whiteColor],
        NSFontAttributeName: [UIFont systemFontOfSize:16]
    };
    [_segControl setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    
    NSDictionary *selectedAttributes = @{
        NSForegroundColorAttributeName: [UIColor redColor],
        NSFontAttributeName: [UIFont boldSystemFontOfSize:16]
    };
    [_segControl setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
    
    [self.view addSubview:_segControl];
    
    self.sv = [[UIScrollView alloc] init];
    self.sv.frame = CGRectMake(0, 144, [UIScreen mainScreen].bounds.size.width, 750);
    self.sv.clipsToBounds = YES;
    self.sv.pagingEnabled = YES;
    self.sv.directionalLockEnabled = YES;
    self.sv.scrollEnabled = YES;
    self.sv.alwaysBounceVertical = NO;
    self.sv.showsVerticalScrollIndicator = NO;
    self.sv.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 750 + 100-44);
    self.sv.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.sv.backgroundColor = wechatBackgroundColor;;
    self.sv.delegate = self;
    [self.view addSubview:self.sv];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.sv.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"share"];
    [self.sv addSubview:_tableView];
    
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, self.sv.frame.size.height) style:UITableViewStylePlain];
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    [_tableView2 registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"share2"];
    [self.sv addSubview:_tableView2];
    
    _tableView3 = [[UITableView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 2, 0, [UIScreen mainScreen].bounds.size.width, self.sv.frame.size.height) style:UITableViewStylePlain];
    _tableView3.delegate = self;
    _tableView3.dataSource = self;
    [_tableView3 registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"share3"];
    [self.sv addSubview:_tableView3];
    
    _arrayData = @[@[@"理塘-世界最高城", @"share顶针", @"15分钟前", @""],
                   @[@"想你😭", @"share牢大", @"15分钟前", @""],
                   @[@"闪电五连鞭", @"share马师傅", @"17分钟前", @""],
                   @[@"黄昏见证虔诚的信徒,巅峰诞生虚伪的拥护", @"share小虾", @"17分钟前", @""],
                   @[@"如期而至", @"share小虾", @"1小时前", @""]];
    
    [self.sv addSubview:_tableView];
}



- (void)segmentedControlValueChanged:(UISegmentedControl *)segmentedControl {
    // 获取当前选中的索引
    NSInteger selectedIndex = segmentedControl.selectedSegmentIndex;
    
    // 获取滚动视图
    UIScrollView *scrollView = self.sv;
    
    // 计算滚动视图的偏移量
    CGFloat offsetX = selectedIndex * scrollView.bounds.size.width;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    // 设置滚动视图的内容偏移量
    [scrollView setContentOffset:CGPointMake(offsetX, offsetY) animated:YES];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 获取滚动视图的水平偏移量
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    
    // 根据滚动视图的偏移量计算要切换的索引
    NSInteger selectedIndex = (double)(contentOffsetX / scrollView.frame.size.width + 0.5);
    
    // 获取到导航栏中的 UISegmentedControl
    UISegmentedControl *segmentedControl = self.segControl;
    // 更新 UISegmentedControl 的索引
    if (selectedIndex != segmentedControl.selectedSegmentIndex) {
        segmentedControl.selectedSegmentIndex = selectedIndex;
    }
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _tableView) {
        ShareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"share" forIndexPath:indexPath];
        cell.titleLabel.text = _arrayData[indexPath.section][0];
        cell.labelFirst.text = _arrayData[indexPath.section][1];
        cell.labelSecond.text = _arrayData[indexPath.section][2];
        cell.labelThird.text = _arrayData[indexPath.section][3];
        cell.backgroundColor = [UIColor whiteColor];//解决办法：初始化时随意调用下contentview，比如背景色
        // 通过调用颜色来实现点击事件，与懒加载有关
        
        NSString *listName = [NSString stringWithFormat:@"image%ld_Third.jpeg", indexPath.section + 1];
        UIImage *list = [UIImage imageNamed:listName];
        list = [list imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        cell.pictureView.image = list;
        return cell;
    } else if (tableView == _tableView2) {
        ShareTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"share2" forIndexPath:indexPath];
        cell2.titleLabel.text = _arrayData[indexPath.section][0];
        cell2.labelFirst.text = _arrayData[indexPath.section][1];
        cell2.labelSecond.text = _arrayData[indexPath.section][2];
        cell2.labelThird.text = _arrayData[indexPath.section][3];
        cell2.backgroundColor = [UIColor whiteColor];//解决办法：初始化时随意调用下contentview，比如背景色
        // 通过调用颜色来实现点击事件，与懒加载有关
        NSString *listName = [NSString stringWithFormat:@"image%ld_Third.jpeg", indexPath.section + 1];
        UIImage *list = [UIImage imageNamed:listName];
        list = [list imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        cell2.pictureView.image = list;
        return cell2;
    } else if (tableView == _tableView3) {
        ShareTableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"share3" forIndexPath:indexPath];
        cell3.titleLabel.text = _arrayData[indexPath.section][0];
        cell3.labelFirst.text = _arrayData[indexPath.section][1];
        cell3.labelSecond.text = _arrayData[indexPath.section][2];
        cell3.labelThird.text = _arrayData[indexPath.section][3];
        cell3.backgroundColor = [UIColor whiteColor];//解决办法：初始化时随意调用下contentview，比如背景色
        // 通过调用颜色来实现点击事件，与懒加载有关
        NSString *listName = [NSString stringWithFormat:@"image%ld_Third.jpeg", indexPath.section + 1];
        UIImage *list = [UIImage imageNamed:listName];
        list = [list imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        cell3.pictureView.image = list;
        return cell3;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
//cell

@end
