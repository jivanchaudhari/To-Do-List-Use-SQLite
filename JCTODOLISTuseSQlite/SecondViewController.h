//
//  SecondViewController.h
//  JCTODOLISTuseSQlite
//
//  Created by Student P_02 on 16/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCDataBaseManager.h"


@interface SecondViewController : UIViewController<UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UIButton *buttonSave;


@property (strong, nonatomic) IBOutlet UITextField *myTextFeild;

- (IBAction)saveButtonAction:(id)sender;
@end

