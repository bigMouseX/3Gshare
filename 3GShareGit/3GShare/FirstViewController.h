//
//  FirstViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UIScrollView *scrollView1;
@property(nonatomic, strong)UIScrollView *scrollView2;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong)NSArray *arrayData;
@property(nonatomic, strong)NSString *zan;
@property(nonatomic, strong)NSString *kan;
@property(nonatomic, strong)NSString *share;


@end

NS_ASSUME_NONNULL_END
