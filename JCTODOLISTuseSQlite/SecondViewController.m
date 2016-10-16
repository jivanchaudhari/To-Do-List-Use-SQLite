//
//  SecondViewController.m
//  JCTODOLISTuseSQlite
//
//  Created by Student P_02 on 16/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)saveTask {
    
    NSString *task = self.myTextFeild.text;
    
    if (task.length > 0) {
        
      //  NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO TASK_TABLE(TASK_ID,TASK) VALUES ('%@','%@')",task.uppercaseString,task];
        
        NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO TASK_TABLE(TASK_ID,TASK) VALUES ('%@','%@')",task.uppercaseString,task];

        NSLog(@"%@",insertQuery);
        
        int result = [[JCDataBaseManager sharedManager]executeQuery:insertQuery];
        
        if (result == 1) {
            
            NSLog(@"Successfully inserted task");
            
        }
        else {
            NSLog(@"Unable to insert task in SQLite DataBase");
            
        }
//        NSLog(@"Task Saved :%@",task);
        self.myTextFeild.text = @" ";
        
    }
    else {
        NSLog(@"Enter Task First to Save");
        
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    [self saveTask];
    return YES;
    
}
- (IBAction)saveButtonAction:(id)sender {
    
    [self saveTask];
    
}
@end
