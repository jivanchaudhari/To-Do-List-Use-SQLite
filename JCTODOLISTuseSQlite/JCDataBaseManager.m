//
//  JCDataBaseManager.m
//  JCTODOLISTuseSQlite
//
//  Created by Student P_02 on 16/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import "JCDataBaseManager.h"

@implementation JCDataBaseManager

+(instancetype ) sharedManager {
    
    static JCDataBaseManager *sharedInstance;
    
    if (sharedInstance == nil) {
        
        sharedInstance = [[JCDataBaseManager alloc]init];
    }
    return sharedInstance;
    
}
-(NSString *)getDataBasePath {
    
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/SBDataBase.sqlite"];
//    NSLog(@"hi");
//    
}

-(int)executeQuery:(NSString *)query {
    
    int success = 0;
    
    const char *UTFquery = [query UTF8String];
    
    const char *UTFDataBasePath = [[self getDataBasePath]UTF8String];
    
    NSLog(@"%s",UTFDataBasePath);
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open(UTFDataBasePath,&myDB) == SQLITE_OK) {
        
        if (sqlite3_prepare(myDB, UTFquery, -1, &statement, NULL) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                success = 1;
            }
            else
            {
                NSLog(@"%s",sqlite3_errmsg(myDB));
            }
            
        }
        else
        {
            NSLog(@"%s",sqlite3_errmsg(myDB));
        }
    }
    else
    {
        NSLog(@"%s",sqlite3_errmsg(myDB));
    }
    sqlite3_close(myDB);
    
    return success;
}

-(NSMutableArray *)getAllTask {
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    sqlite3_stmt *statement;
    
    NSString *query = @"SELECT * FROM TASK_TABLE";
    
    const char *UTFquery = [query UTF8String];
    
    const char *UTFDataBasePath = [[ self getDataBasePath]UTF8String];
    
    if (sqlite3_open(UTFDataBasePath, &myDB) == SQLITE_OK) {
        
        NSLog(@"Open");
        
        if (sqlite3_prepare(myDB, UTFquery, -1, &statement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                const char *taskString = (const char * )sqlite3_column_text(statement, 0);
                
                NSString *task = [NSString stringWithUTF8String:taskString];
                
                NSLog(@"\n\nTask %@",task);
                
                [array addObject:task];
            }
        }
    
    sqlite3_close(myDB);
    }
        return array;
}
@end








