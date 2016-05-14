#import "SWDatabase.h"
#import "SWResult.h"

@implementation SWDatabase {
    sqlite3 *_sqlite;
}

#pragma mark Initializators

- (instancetype)initWithFileName:(NSString *)filename
{
    self = [super init];
    if (self) {
        // open database
        CC(sqlite3_open(filename.UTF8String, &_sqlite));
    }
    return self;
}

- (void)dealloc
{
    sqlite3_close(_sqlite);
    _sqlite = NULL;
}

#pragma mark Private methods

- (void)__bindParams:(NSArray *)params toStmt:(sqlite3_stmt *)stmt
{
    [params enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
      if ([obj isKindOfClass:[NSString class]]) {
          // string
          NSString *str = (NSString *)obj;
          CC(sqlite3_bind_text(stmt, idx, str.UTF8String, -1, NULL));
      }
      else if ([obj isKindOfClass:[NSNumber class]]) {
          // number
          NSNumber *num = (NSNumber *)obj;
          CC(sqlite3_bind_double(stmt, idx, num.doubleValue));
      }
    }];
}

#pragma mark Public methods

- (void)runSQL:(NSString *)sql
{
    [self runSQL:sql params:nil];
}

- (void)runSQL:(NSString *)sql params:(NSArray *)params
{
    sqlite3_stmt *stmt;
    CC(sqlite3_prepare(_sqlite, sql.UTF8String, -1, &stmt, NULL));

    // assign parameters
    if (params) {
        [self __bindParams:params toStmt:stmt];
    }

    CC(sqlite3_step(stmt));
    CC(sqlite3_finalize(stmt));
}

- (SWResult *)querySQL:(NSString *)sql
{
    return [self querySQL:sql params:nil];
}

- (SWResult *)querySQL:(NSString *)sql params:(NSArray *)params
{
    sqlite3_stmt *stmt;
    CC(sqlite3_prepare(_sqlite, sql.UTF8String, -1, &stmt, NULL));

    // assign parameters
    if (params) {
        [self __bindParams:params toStmt:stmt];
    }

    SWResult *result = [[SWResult alloc] initWithSqlite3:_sqlite statement:stmt];
    return result;
}

@end
