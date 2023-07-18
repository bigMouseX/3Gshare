//
//  ScrollerTableViewCell.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/12.
//

#import "ScrollerTableViewCell.h"

@implementation ScrollerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    //================顶部滚动视图=====================
    self.scrollView2 = [[UIScrollView alloc] init];
    
    self.scrollView2.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 180);
    //是否按照整页来滚动
    self.scrollView2.pagingEnabled = YES;
    //是否可以开启滚动效果
    self.scrollView2.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView2.contentSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width) * 5, 180);
    
    //是否可以边缘弹动效果
    //这个是比较有用的点，可以让我们第一张与最后一张图片只能向前或向后拉动，而不能向没有图片的方向拉动
    //bounces的意思是弹动
    self.scrollView2.bounces = YES;
    //开启横向弹动效果
    self.scrollView2.alwaysBounceHorizontal = YES;
    //开启纵向弹动效果
    //一般会开启，但是对于滚动的只有图片不需要刷新的最好不要开启
    //    sv.alwaysBounceVertical = YES;
    //显示横向滚动条
    //    sv.showsHorizontalScrollIndicator = YES;
    //是否显示纵向滚动条
    //必须要画布大小大于滚动视图框架大小才能显示
    self.scrollView2.showsVerticalScrollIndicator = YES;
    //设置背景颜色
    self.scrollView2.backgroundColor = [UIColor whiteColor];
    
    // 设置滚动视图的圆角
    //    self.scrollView2.layer.cornerRadius = self.textField.bounds.size.height / 2.0;
    self.scrollView2.layer.masksToBounds = YES;
    [self.contentView addSubview:self.scrollView2];
    
    //================顶部循环滚动视图实现===============================
    // 图片视图的尺寸
    CGFloat imageViewWidth1 = [UIScreen mainScreen].bounds.size.width;
    CGFloat imageViewHeight1 = 180;
    
    // 遍历添加图片视图
    for (int i = 0; i <= 4; i++) {
        NSString *strName = [NSString stringWithFormat:@"main%d.jpg", (i % 3) + 1];
        
        // 创建图片
        UIImage *image = [UIImage imageNamed:strName];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        // 创建视图
        UIImageView *iView = [[UIImageView alloc] initWithImage:image];
        
        // 设置每个视图的frame
        if (i == 4) {
            // 最后一张图片视图
            iView.frame = CGRectMake(0, 0, imageViewWidth1, imageViewHeight1);
            //这里加最后一张图片
            iView.image = [UIImage imageNamed:@"main3.jpg"];
            
        } else {
            // 其他图片视图
            //这里的尺寸记得第一个参数一定要是图片尺寸的大小
            iView.frame = CGRectMake(imageViewWidth1 * (i + 1), 0, imageViewWidth1, imageViewHeight1);
        }
        
        // 添加视图到滚动视图中
        //这里之所以我们的上面第一个参数一定要是图片尺寸的大小。是因为我们是将iview添加到滚动视图中，所以是以滚动视图的尺寸为基准，也就是说0的地方就是滚动视图的左上角而不是屏幕的左上角，这点要重点记
        [self.scrollView2 addSubview:iView];
        
        
    }
    
    
    // 设置初始偏移量到第二张图片
    [self.scrollView2 setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0) animated:NO];
    
    // 实现滚动到最后一张视图时，再次滚动能回到第一张视图
    self.scrollView2.delegate = self;
    
    //================顶部循环滚动视图实现===============================
    
    //  ==============分页器======================
    // 创建一个分页器
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.numberOfPages = 3; // 设置总页数
    self.pageControl.currentPage = 0; // 设置初始当前页
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor]; // 设置分页指示器颜色
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor]; // 设置当前页指示器颜色
    CGFloat pageControlY = CGRectGetMaxY(self.scrollView2.frame) + 10;
    self.pageControl.frame = CGRectMake(0, pageControlY, CGRectGetWidth(self.contentView.frame), 0);
    [self.contentView addSubview:self.pageControl];
    //=================分页器===================
    
    [self.contentView addSubview:self.scrollView2];
    
    //定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

    
    return self;
}

//定时器
- (void)scrollToNextPage {
    CGPoint contentOffset = self.scrollView2.contentOffset;
    CGFloat screenWidth = CGRectGetWidth(self.scrollView2.frame);
    NSInteger currentPage = contentOffset.x / screenWidth;
    NSInteger nextPage = currentPage + 1;
    if (nextPage > self.pageControl.numberOfPages) {
        nextPage = 1;
    }
    contentOffset.x = nextPage * screenWidth;
    [self.scrollView2 setContentOffset:contentOffset animated:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}
//定时器

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//================顶部循环滚动视图函数实现===============================
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //当前滚动到的x位置
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    CGFloat screenWidth = CGRectGetWidth(scrollView.frame);
    CGFloat contentWidth = scrollView.contentSize.width;
    
    // 滚动到最后一张视图之后，将滚动位置重置到第二张图片
    if (contentOffsetX >= contentWidth - screenWidth) {
        [scrollView setContentOffset:CGPointMake(screenWidth, 0) animated:NO];
    }
    // 滚动到第一张视图之前，将滚动位置重置到倒数第二张图片
//    else if (contentOffsetX < screenWidth - scrollView.frame.size.width) {
//        [scrollView setContentOffset:CGPointMake(contentWidth - 2 * screenWidth, 0) animated:NO];
//        self.pageControl.currentPage = 2;
//        return;
//    }
    //滚动到第一张视图之后，将滚动位置重置到倒数第一张图片
    else if (contentOffsetX <= 0 ) {
        [scrollView setContentOffset:CGPointMake(3 * screenWidth, 0) animated:NO];
        self.pageControl.currentPage = 3;
        return;
    }
    CGFloat pageWidth = self.scrollView2.frame.size.width;
    NSInteger currentPage = floor((scrollView.contentOffset.x) / pageWidth) - 1;
    self.pageControl.currentPage = currentPage;
    //
//    if (contentOffsetX == 0) {
//        self.pageControl.currentPage = 2;
//
//    }
}
//================顶部循环滚动视图函数实现===============================

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
