//
//  TabBarController.m
//  Navigation
//
//  Created by Ana Elisa Pessoa Aguiar on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "TabBarController.h"
#import "ListaTableViewController.h"
#import "View2.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    View2 *viewController = [[View2 alloc] initWithNibName:nil bundle:nil];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    ListaTableViewController *lista = [[ListaTableViewController alloc] init];
    
    //criando esse MutableArray para falar oq vai criar na tabBar
    //UITabBar *tabar = [[UITabBar alloc] init];
    NSMutableArray *tabar = [[NSMutableArray alloc] init];
    [tabar addObject:navigation];
    [tabar addObject:lista];
    [self setViewControllers:tabar];
    navigation.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Palavras" image:[UIImage imageNamed:@""] tag:1];
    lista.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Lista" image:[UIImage imageNamed:@""] tag:2];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
