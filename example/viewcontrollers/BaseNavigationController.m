//
//  BaseNavigationController.m
//  RNFrostedSidebar
//
//  Created by Sem0043 on 30/04/2018.
//  Copyright © 2018 Ryan Nystrom. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
