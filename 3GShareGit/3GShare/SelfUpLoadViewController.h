//
//  SelfUpLoadViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelfUpLoadViewController : UIViewController<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property(retain, nonatomic)UISegmentedControl *segControl;
@property(retain, nonatomic)UIScrollView *sv;
@property(retain, nonatomic)UITableView *tableView;
@property(nonatomic, strong)NSArray *arrayData;
@property(retain, nonatomic)UITableView *tableView2;
@property(retain, nonatomic)UITableView *tableView3;

@end

NS_ASSUME_NONNULL_END
