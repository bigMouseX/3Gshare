//
//  ScrollerTableViewCell.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrollerTableViewCell : UITableViewCell<UIScrollViewDelegate>
@property(nonatomic, strong)UIScrollView *scrollView2;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end

NS_ASSUME_NONNULL_END
