//
//  SelectShareViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/15.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectShareViewController : ViewController<UITableViewDelegate,
UITableViewDataSource>

//不要忘记这个
@property UITableView* tableView;
@property(nonatomic, strong)NSArray *arrayData;
@property(nonatomic, strong)UIScrollView *scrollView1;
@property(nonatomic, strong)NSString *zan_chuan;
@property(nonatomic, strong)NSString *kan_chuan;
@property(nonatomic, strong)NSString *share_chuan;

@end

NS_ASSUME_NONNULL_END
