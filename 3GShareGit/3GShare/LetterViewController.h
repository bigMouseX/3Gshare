//
//  LetterViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LetterViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *arrayData;
@property(nonatomic, strong)NSArray *arrayData2;

@end

NS_ASSUME_NONNULL_END
