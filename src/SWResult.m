//
//  L4SqliteResult.m
//  life4words
//
//  Created by Matthew Lee on 16/5/12.
//  Copyright © 2016年 Cizhen Technology. All rights reserved.
//

#import "SWResult.h"

@implementation SWResult
{
    sqlite3_stmt *_stmt;
}

#pragma mark Initializators

- (instancetype)initWithSqlite3:(sqlite3 *)sqlite3 statement:(sqlite3_stmt *)stmt
{
    self = [super initWithSqlite3:sqlite3];
    if (self) {
        _stmt = stmt;
    }
    return self;
}

- (void)dealloc
{
    CC(sqlite3_finalize(_stmt));
}

#pragma mark Public methods

- (BOOL)fetchNext
{
    int ret = CC(sqlite3_step(_stmt));
    return ret == SQLITE_ROW;
}

- (NSString *)asStringWithColumnIndex:(NSInteger)columnIndex
{
    const unsigned char *sz = sqlite3_column_text(_stmt, columnIndex);
    if (sz) {
        return [NSString stringWithUTF8String:(const char *)sz];
    }
    else {
        return nil;
    }
}

- (NSInteger)asIntegerWithColumnIndex:(NSInteger)columnIndex
{
    return sqlite3_column_int(_stmt, columnIndex);
}

@end
