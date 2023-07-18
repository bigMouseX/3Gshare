//
//  SceneDelegate.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/8.
//

#import "SceneDelegate.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    //  登陆界面
//    LoginViewController *loginViewController = [[LoginViewController alloc] init];
//    self.window.rootViewController = loginViewController;
    
    //首页
    FirstViewController *vcFirst = [[FirstViewController alloc] init];
    UIImage *vcFirst_normalImage = [UIImage imageNamed:@"button1_normal.png"];
    vcFirst_normalImage = [vcFirst_normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *vcFirst_pressImage = [UIImage imageNamed:@"button1_pressed.png"];
    vcFirst_pressImage = [vcFirst_pressImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *vcFirstIcon = [[UITabBarItem alloc] initWithTitle:@"" image:vcFirst_normalImage selectedImage:vcFirst_pressImage];
    vcFirst.tabBarItem = vcFirstIcon;
    UINavigationController *navFirst = [[UINavigationController alloc]initWithRootViewController:vcFirst];
    
    SecondViewController *vcSecond = [[SecondViewController alloc] init];
    UIImage *vcSecond_normalImage = [UIImage imageNamed:@"button2_normal.png"];
    vcSecond_normalImage = [vcSecond_normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *vcSecond_pressImage = [UIImage imageNamed:@"button2_pressed.png"];
    vcSecond_pressImage = [vcSecond_pressImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *vcSecondIcon = [[UITabBarItem alloc] initWithTitle:@"" image:vcSecond_normalImage selectedImage:vcSecond_pressImage];
    vcSecond.tabBarItem = vcSecondIcon;
    UINavigationController *navSecond = [[UINavigationController alloc]initWithRootViewController:vcSecond];

    
    ThirdViewController *vcThird = [[ThirdViewController alloc] init];
    UIImage *vcThird_normalImage = [UIImage imageNamed:@"button3_normal.png"];
    vcThird_normalImage = [vcThird_normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *vcThird_pressImage = [UIImage imageNamed:@"button3_pressed.png"];
    vcThird_pressImage = [vcThird_pressImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *vcThirdIcon = [[UITabBarItem alloc] initWithTitle:@"" image:vcThird_normalImage selectedImage:vcThird_pressImage];
    vcThird.tabBarItem = vcThirdIcon;
    UINavigationController *navThird = [[UINavigationController alloc]initWithRootViewController:vcThird];
    
    FourthViewController *vcFourth = [[FourthViewController alloc] init];
    UIImage *vcFourth_normalImage = [UIImage imageNamed:@"button4_normal.png"];
    vcFourth_normalImage = [vcFourth_normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *vcFourth_pressImage = [UIImage imageNamed:@"button4_pressed.png"];
    vcFourth_pressImage = [vcFourth_pressImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *vcFourthIcon = [[UITabBarItem alloc] initWithTitle:@"" image:vcFourth_normalImage selectedImage:vcFourth_pressImage];
    vcFourth.tabBarItem = vcFourthIcon;
    UINavigationController *navFourth = [[UINavigationController alloc]initWithRootViewController:vcFourth];
    
    FifthViewController *vcFifth = [[FifthViewController alloc] init];
    UIImage *vcFifth_normalImage = [UIImage imageNamed:@"button5_normal.png"];
    vcFifth_normalImage = [vcFifth_normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *vcFifth_pressImage = [UIImage imageNamed:@"button5_pressed.png"];
    vcFifth_pressImage = [vcFifth_pressImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *vcFifthIcon = [[UITabBarItem alloc] initWithTitle:@"" image:vcFifth_normalImage selectedImage:vcFifth_pressImage];
    vcFifth.tabBarItem = vcFifthIcon;
    UINavigationController *navFifth = [[UINavigationController alloc]initWithRootViewController:vcFifth];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[navFirst, navSecond, navThird, navFourth, navFifth];
    tabBarController.selectedIndex = 0;
    
    tabBarController.tabBar.tintColor = [UIColor redColor]; // 设置选中的 TabBarItem 颜色
    tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tabBarController;
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
