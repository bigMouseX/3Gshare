//
//  DabaiViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DabaiViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property(strong, nonatomic)UISearchBar *searchBar;

@end

NS_ASSUME_NONNULL_END
