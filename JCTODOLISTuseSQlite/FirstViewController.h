//
//  FirstViewController.h
//  JCTODOLISTuseSQlite
//
//  Created by Student P_02 on 16/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCDataBaseManager.h"


@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *allTask;
    
}
@property (strong, nonatomic) IBOutlet UITableView *myTableView;


@end

