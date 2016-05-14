#import <Foundation/Foundation.h>

#import <sqlite3.h>

#import "SWObject.h"

@class SWResult;

@interface SWDatabase : SWObject

/**
 *  initialize database
 *
 *  @param filename database filename
 *
 *  @return database object instance
 */
- (instancetype)initWithFileName:(NSString *)filename;

/**
 *  run a sql statement
 *
 *  @param sql sql statement
 */
- (void)runSQL:(NSString *)sql;

/**
 *  run a sql statement with parameters (NSArray)
 *
 *  @param sql    sql statement
 *  @param params parameters
 */
- (void)runSQL:(NSString *)sql params:(NSArray *)params;

/**
 *  start a query with sql statement
 *
 *  @param sql sql statement
 *
 *  @return result object
 */
- (SWResult *)querySQL:(NSString *)sql;

/**
 *  start a query with sql statement
 *
 *  @param sql    sql statement
 *  @param params parameters
 *
 *  @return result object
 */
- (SWResult *)querySQL:(NSString *)sql params:(NSArray *)params;

@end
