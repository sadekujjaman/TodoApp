//
//  ViewController.h
//  TODOProject
//
//  Created by Saiful Islam on 20/12/18.
//  Copyright © 2018 Saiful Islam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)addTODO:(id)sender;


@end

