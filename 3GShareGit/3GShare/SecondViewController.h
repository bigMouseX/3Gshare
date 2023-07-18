//
//  SecondViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController <UISearchBarDelegate>
@property(retain, nonatomic)UISearchBar *searchBar;
@property(nonatomic, strong)NSArray *arrayData;
@end

NS_ASSUME_NONNULL_END
