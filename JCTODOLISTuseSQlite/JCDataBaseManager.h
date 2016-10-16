//
//  JCDataBaseManager.h
//  JCTODOLISTuseSQlite
//
//  Created by Student P_02 on 16/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface JCDataBaseManager : NSObject
{
    sqlite3 *myDB;
    
}
+(instancetype) sharedManager;

-(NSString *) getDataBasePath;

-(int) executeQuery:(NSString * )query;



-(NSMutableArray *)getAllTask;




@end
