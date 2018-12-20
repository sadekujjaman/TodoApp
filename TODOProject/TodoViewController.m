//
//  ViewController.m
//  TODOProject
//
//  Created by Saiful Islam on 20/12/18.
//  Copyright © 2018 Saiful Islam. All rights reserved.
//

#import "TodoViewController.h"

@interface TodoViewController ()
{
    NSMutableArray *todoList;
}

@end

@implementation TodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    todoList = [[NSMutableArray alloc] init];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self.tableView setEstimatedRowHeight:100.0];
    [self.tableView setRowHeight:UITableViewAutomaticDimension];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)addTODO:(id)sender {
    

    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add Todo" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * textField){
        [textField setPlaceholder:@"Enter Todo"];
    }];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSString *todo = alert.textFields.firstObject.text;
       
        NSLog(@"%@",todo);
        [self add:todo];
    }];
    
    [alert addAction:action];
    

    [self presentViewController:alert animated:true completion:nil];
    
    
}

-(void)add:(NSString *)todo{
    NSInteger index = 0;
    [todoList insertObject:todo atIndex:0];
   
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
   
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationLeft];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return todoList.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] init];
    [cell.textLabel setText:todoList[indexPath.row]];

    
    [cell.textLabel setContentMode:UIViewContentModeScaleToFill];
    [cell.textLabel setNumberOfLines:0];
    
    [cell.textLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [cell.textLabel setTag:indexPath.row];
  
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0.0f, 0.0f, 150.0f, 25.0f);
    
    [button setTitle:@"Edit"
            forState:UIControlStateNormal];

    button.tag = todoList.count;

    [button addTarget:self
               action:@selector(performExpand:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [cell setAccessoryView:button];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"L: %ld", indexPath.row);
}



- (void) performExpand:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    NSInteger index = todoList.count - button.tag;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Edit Todo" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * textField){

        [textField setText:todoList[index]];
    }];

    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSString *todo = alert.textFields.firstObject.text;

        
        [todoList removeObjectAtIndex:index];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        
        [todoList insertObject:todo atIndex:index];
        
        
        [self.tableView insertRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationRight];
    }];

    [alert addAction:action];


    [self presentViewController:alert animated:true completion:nil];

}




-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [todoList removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

//
//- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
