//
//  AppDelegate.m
//  GCDFetchFeed
//
//  Created by DaiMing on 16/1/19.
//  Copyright © 2016年 Starming. All rights reserved.
//

#import "AppDelegate.h"

#import "SMRootViewController.h"
#import "SMFeedListViewController.h"
#import "SMMapViewController.h"
#import "SMStyle.h"
#import "SMFeedModel.h"
#import "SMLagMonitor.h"

#import <dlfcn.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //Injection 工具，加快调试速度 https://github.com/glt3953/InjectionIII
    #if DEBUG
       // iOS
       [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];

       // 同时还支持 tvOS 和 MacOS，配置时只需要在 /Applications/InjectionIII.app/Contents/Resources/ 目录下找到对应的 bundle 文件,替换路径即可
    #endif
    
    //这里是做卡顿监测
//    [[SMLagMonitor shareInstance] beginMonitor];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //首页
    SMRootViewController *rootVC = [[SMRootViewController alloc] init];
//    UINavigationController *homeNav = [self styleNavigationControllerWithRootController:rootVC];
    UINavigationController *homeNav = [self styleNavigationControllerWithRootController:rootVC];
//    UITabBarItem *homeTab = [[UITabBarItem alloc] initWithTitle:@"频道" image:nil tag:1];
//    homeTab.titlePositionAdjustment = UIOffsetMake(0, -20);
//    homeNav.tabBarItem = homeTab;
//    
//    //列表
//    SMFeedModel *feedModel = [SMFeedModel new];
//    feedModel.fid = 0;
//    SMFeedListViewController *feedListVC = [[SMFeedListViewController alloc] initWithFeedModel:feedModel];
//    UINavigationController *listNav = [self styleNavigationControllerWithRootController:feedListVC];
//    UITabBarItem *listTab = [[UITabBarItem alloc] initWithTitle:@"列表" image:nil tag:2];
//    listTab.titlePositionAdjustment = UIOffsetMake(0, -18);
//    listNav.tabBarItem = listTab;
//    
//    //map
//    SMMapViewController *mapVC = [[SMMapViewController alloc] init];
//    UINavigationController *mapNav = [self styleNavigationControllerWithRootController:mapVC];
//    UITabBarItem *mapTab = [[UITabBarItem alloc] initWithTitle:@"地图" image:nil tag:2];
//    mapTab.titlePositionAdjustment = UIOffsetMake(0, -18);
//    mapNav.tabBarItem = mapTab;
//    
//    UITabBarController *tabBarC = [[UITabBarController alloc]initWithNibName:nil bundle:nil];
//    tabBarC.tabBar.tintColor = [SMStyle colorPaperBlack];
//    tabBarC.tabBar.barTintColor = [SMStyle colorPaperDark];
//    UIView *shaowLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tabBarC.tabBar.frame), 0.5)];
//    shaowLine.backgroundColor = [UIColor colorWithHexString:@"D8D7D3"];
//    [tabBarC.tabBar addSubview:shaowLine];
//    tabBarC.tabBar.shadowImage = [UIImage new];
//    tabBarC.tabBar.clipsToBounds = YES;
//    tabBarC.viewControllers = @[homeNav,listNav,mapNav];
    
//    self.window.rootViewController = tabBarC;
    self.window.rootViewController = homeNav;
    [self.window makeKeyAndVisible];
    return YES;
}

- (UINavigationController *)styleNavigationControllerWithRootController:(UIViewController *)vc {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    nav.navigationBar.tintColor = [SMStyle colorPaperLight];
//    nav.navigationBar.barTintColor = [SMStyle colorPaperLight];
    nav.navigationBar.backgroundColor = [SMStyle colorPaperLight];
    UIView *shaowLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(nav.navigationBar.frame), CGRectGetWidth(nav.navigationBar.frame), 0.5)];
    shaowLine.backgroundColor = [UIColor colorWithHexString:@"D8D7D3"];
    [nav.navigationBar addSubview:shaowLine];
    nav.navigationBar.translucent = NO;
    return nav;
}

// MARK: - 代码覆盖回调函数
//void __sanitizer_cov_trace_pc_guard_init(uint32_t *start,
//                                         uint32_t *stop) {
//    static uint64_t N;
//    if (start == stop || *start) return;
//    printf("INIT: %p %p\n", start, stop);
//    for (uint32_t *x = start; x < stop; x++)
//        *x = ++N;
//}
//
//void __sanitizer_cov_trace_pc_guard(uint32_t *guard) {
//    if (!*guard) return;
//    void *PC = __builtin_return_address(0);
//    Dl_info info;
//    dladdr(PC, &info);
//    printf("调用了方法: %s \n", info.dli_sname);
//}

@end
