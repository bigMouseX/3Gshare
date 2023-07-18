//
//  LetterViewController.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/17.
//

#import "LetterViewController.h"
#import "LetterTableViewCell.h"
#import "ChatViewController.h"
#define newColor [UIColor colorWithRed:50.0 / 255.0 green:142.0 / 255.0 blue:220.0 / 255.0 alpha:1.0]
#define wechatBackgroundColor [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0]
@interface LetterViewController ()

@end

@implementation LetterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrayData =@[@"share小格", @"share小明", @"share小李", @"share小坤"];
    _arrayData2 =@[@"你的作品我很喜欢", @"谢谢，已经关注您", @"为你点赞！", @"你好可以问问你是怎么拍的吗"];

    self.view.backgroundColor = wechatBackgroundColor;
    ///===/////

    
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
    titlelabel.text = @"私信";
    titlelabel.textColor = [UIColor whiteColor];
    titlelabel.font = [UIFont systemFontOfSize:18];
    self.navigationItem.titleView = titlelabel;
    
    // 设置导航栏标题的样式
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
    //=======}
    
    //=======
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, UIScreen.mainScreen.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[LetterTableViewCell class] forCellReuseIdentifier:@"letter"];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setImage:[UIImage imageNamed:@"back_img.png"] forState:UIControlStateNormal];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        LetterTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"letter" forIndexPath:indexPath];
        cell.name.text = _arrayData[indexPath.row];
        cell.name2.text = _arrayData2[indexPath.row];
        cell.name3.text = @"11-03 09:36";
        cell.backgroundColor = [UIColor whiteColor];//解决办法：初始化时随意调用下contentview，比如背景色
        
        NSString *str = [NSString stringWithFormat:@"headPhoto%ld.jpg", indexPath.row + 1];
        UIImage *image = [UIImage imageNamed:str];
        cell.icon.image = image;
            


        CALayer *separatorLayer = [CALayer layer];
        separatorLayer.frame = CGRectMake(0, 60, self.view.frame.size.width - 10, 1); // 修改宽度，减去左右边距
        UIColor *separatorColor = [UIColor colorWithWhite:0.90 alpha:1.0];
        separatorLayer.backgroundColor = separatorColor.CGColor;
        [cell.contentView.layer addSublayer:separatorLayer]; // 添加到contentView的layer上
        
        return cell;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return 4;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)pressback {

    [self.navigationController popViewControllerAnimated:YES];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:0.5];
    ChatViewController *t = [[ChatViewController alloc] init];
    // 重新将返回页面的视图控制器添加到导航栈中
    [self.navigationController pushViewController:t animated:YES];

}
-(void)unselectCell:(id)sender{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    }

@end
