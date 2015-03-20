//
//  ListaTableViewController.h
//  Navigation
//
//  Created by Ana Elisa Pessoa Aguiar on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ListaTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tv;

@end
