//
//  GuanzhuViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GuanzhuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *arrayData;
@end

NS_ASSUME_NONNULL_END
