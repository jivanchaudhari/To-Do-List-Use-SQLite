//
//  FirstViewController.m
//  JCTODOLISTuseSQlite
//
//  Created by Student P_02 on 16/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import "FirstViewController.h"
#import "JCDataBaseManager.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    allTask = [[NSMutableArray alloc]init];
    
}
-(void)viewDidAppear:(BOOL)animated {
    
    [self reloadTask];
}
-(void)reloadTask {
    
    allTask = [[JCDataBaseManager sharedManager]getAllTask];
    
    NSLog(@"\nAll task %@",allTask);
    
    [self.myTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return allTask.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [allTask objectAtIndex:indexPath.row];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Delete");
    
    NSString *task = [allTask objectAtIndex:indexPath.row];
    
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM TASK_TABLE WHERE TASK_ID = '%@'",task.uppercaseString];
    if ([[JCDataBaseManager sharedManager]executeQuery:deleteQuery] == 1) {
        
        [self reloadTask];
        NSLog(@"Sucessfully Deleted");
    
    }
    else {
        NSLog(@"Faild To Delete Task");
        
    }
    
}

@end
