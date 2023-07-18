#import "PhotoWallViewController.h"
#import "UpLoadViewController.h"
@interface PhotoWallViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) NSInteger selectedPhotoCount;

@end

@implementation PhotoWallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"照片";
    
    UIBarButtonItem *btnFinish = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(pressUp)];
    self.navigationItem.rightBarButtonItem = btnFinish;
    
    // 创建滚动视图
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.showsHorizontalScrollIndicator = YES;
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.alwaysBounceHorizontal = YES;
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    // 添加滚动视图到主视图
    [self.view addSubview:self.scrollView];
    
    for (int i = 0; i <= 8; i++) {
        NSString *imageName = [NSString stringWithFormat:@"headPhoto%d.jpg", i + 1];
        NSString *selectedImageName = [NSString stringWithFormat:@"headPhotoSelect%d.jpg", i + 1];
        
        UIImage *image = [UIImage imageNamed:imageName];
        UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((i % 3) * (self.view.bounds.size.width / 3), (i / 3) * 140, 130, 130);
        [button setImage:image forState:UIControlStateNormal];
        [button setImage:selectedImage forState:UIControlStateSelected];
        button.userInteractionEnabled = YES;
        button.tag = i + 1;
        [button addTarget:self action:@selector(pressTap:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.scrollView addSubview:button];
    }
}

- (void)pressTap:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        self.selectedPhotoCount++;
    } else {
        self.selectedPhotoCount--;
    }
}

- (void)pressUp {
    if (self.selectedPhotoCount >= 1) {
        // 遍历滚动视图的子视图，查找选中的按钮
        for (UIView *subview in self.scrollView.subviews) {
            if ([subview isKindOfClass:[UIButton class]]) {
                UIButton *button = (UIButton *)subview;
                if (button.selected) {
                    // 获取选中的图片
                    UIImage *image = [button imageForState:UIControlStateNormal];
                    [self.delegate changePhoto:image count:self.selectedPhotoCount];
                    // 处理选中的图片
                    button.selected = NO;
                    //一定要加break，不然会遍历每一张图片
                    break;
                }
            }
        }
        
        self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"更改成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //推出导航栏控制器
            [self.navigationController popViewControllerAnimated:YES];
            self.selectedPhotoCount = 0;
        }];
        [self.alert addAction:confirmAction];
        [self presentViewController:self.alert animated:YES completion:nil];
    } else {
        self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请至少选中一张图片" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [self.alert addAction:confirmAction];
        [self presentViewController:self.alert animated:YES completion:nil];
    }
}

@end
