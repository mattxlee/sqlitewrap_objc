#import <Foundation/Foundation.h>

#import "SWDatabase.h"
#import "SWResult.h"

int main(int argc, const char *argv[])
{
    @autoreleasepool {
        // create database
        SWDatabase *database = [[SWDatabase alloc] initWithFileName:@"sample.db"];
        @try {
            [database runSQL:@"create table first_table(id, id2, value)"];
        } @catch (NSException *exception) {
            printf("table already exists\n");
        } @finally {
        }

        // delete data
        [database runSQL:@"delete from first_table"];

        // insert data
        for (int i = 0; i < 100; ++i) {
            [database runSQL:@"insert into first_table(id, id2, value) values(?, ?, ?)"
                      params:@[ @(i), @(i * 2), @(i * 3) ]];
        }

        // query data
        SWResult *result = [database querySQL:@"select id, id2, value from first_table"];
        while ([result fetchNext]) {
            NSInteger id1 = [result asIntegerWithColumnIndex:0];
            NSInteger id2 = [result asIntegerWithColumnIndex:1];
            NSInteger value = [result asIntegerWithColumnIndex:2];
            printf("%ld, %ld, %ld\n", id1, id2, value);
        }
    }
    return 0;
}
