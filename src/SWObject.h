//
//  L4SqliteObject.h
//  life4words
//
//  Created by Matthew Lee on 16/5/12.
//  Copyright © 2016年 Matthew Only. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

#define CC(__ret__) [self throwOrContinue:__ret__]

@interface SWObject : NSObject

/**
 *  check sqlite3 result code, throw exception if meet an error
 *
 *  @param sqliteReturnCode error code
 *
 *  @return the error code
 */
- (int)throwOrContinue:(int)sqliteReturnCode;

/**
 *  initialize sqlite object (Abstract object, do not create it)
 *
 *  @param sqlite sqlite3* value
 *
 *  @return the sqlite object instance
 */
- (instancetype)initWithSqlite3:(sqlite3 *)sqlite;

/**
 *  get sqlite3* value
 *
 *  @return sqlite3* value
 */
- (sqlite3 *)sqlite3;

@end
