//
//  L4SqliteObject.m
//  life4words
//
//  Created by Matthew Lee on 16/5/12.
//  Copyright © 2016年 Matthew Only. All rights reserved.
//

#import <sqlite3.h>

#import "SWObject.h"

@implementation SWObject {
    sqlite3 *_sqlite;
}

#pragma mark Private methods

- (int)throwOrContinue:(int)sqliteReturnCode
{
    if (sqliteReturnCode == SQLITE_OK || sqliteReturnCode == SQLITE_ROW || sqliteReturnCode == SQLITE_DONE) {
        // ok, sqlite result is ok
        return sqliteReturnCode;
    }

    const char *errmsg = sqlite3_errmsg(_sqlite);
    NSLog(@"sqlite error: %s", errmsg);
    [NSException raise:@"sqlite error" format:@"error message: %s", errmsg];

    return sqliteReturnCode;
}

#pragma mark Initializators

- (instancetype)initWithSqlite3:(sqlite3 *)sqlite
{
    self = [super init];
    if (self) {
        _sqlite = sqlite;
    }
    return self;
}

#pragma mark Public methods

- (sqlite3 *)sqlite3
{
    return _sqlite;
}

@end
