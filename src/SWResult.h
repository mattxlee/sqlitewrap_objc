//
//  L4SqliteResult.h
//  life4words
//
//  Created by Matthew Lee on 16/5/12.
//  Copyright © 2016年 Cizhen Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

#import "SWObject.h"

@interface SWResult : SWObject

/**
 *  initialize result object
 *
 *  @param stmt sqlite3 statement value
 *
 *  @return instance of result object
 */
- (instancetype)initWithSqlite3:(sqlite3 *)sqlite3 statement:(sqlite3_stmt *)stmt;

/**
 *  get next row
 *
 *  @return if it is YES, means still have rows
 */
- (BOOL)fetchNext;

/**
 *  fetch current row column as a string value
 *
 *  @param columnIndex column index of current row
 *
 *  @return string value
 */
- (NSString *)asStringWithColumnIndex:(NSInteger)columnIndex;

/**
 *  fetch current row column as a integer value
 *
 *  @param columnIndex column index of current row
 *
 *  @return integer value
 */
- (NSInteger)asIntegerWithColumnIndex:(NSInteger)columnIndex;

@end
