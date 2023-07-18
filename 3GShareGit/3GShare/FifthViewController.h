//
//  FifthViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/12.
//

#import <UIKit/UIKit.h>
#import "MyMessageViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface FifthViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong)NSArray *arrayData;
@property (retain, nonatomic)UIAlertController *alert;
@property (nonatomic, strong) MyMessageViewController *mm;

@end

NS_ASSUME_NONNULL_END
