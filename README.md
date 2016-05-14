# A simple Sqlite wrapping library for Objective-C
This is a simple sqlite wrapping library, writing in Objective-C. You can clone it and open the sample project by Xcode.
```
git clone https://github.com/mattxlee/sqlitewrap_objc
```

## How to use

### Open or create a database
create a instance of SWDatabase with a local filename, if this file is exist it will be opened as a sqlite database, otherwise a new sqlite database file will be created
```
SWDatabase *db = [[SWDatabase alloc] initWithFileName:@"sample.db"];
```

### Run sql statement
You can run a simple sql statement
```
[db runSQL:@"delete from sample where `id` = 100"];
```

## Run sql statement with parameters
Wrapping library supports simple parameter for your sql statement, you just simply put `?` to your sql statement and setup the value for parameters pass it to method as an array
```
[db runSQL:@"delete from sample where `id` = ?" params:@[ 100 ]];
```
If you have more than one parameters, you just add it to array
```
[db runSQL:@"delete from sample where `id` = ? and `id2` = ?" params:@[ 100, 200 ]];
```

### Run sql statement and get results
By using function **querySQL:** and **querySQL:params:** from SWDatabase will return an object created from the result of your sql statement. Fetch rows by calling **fetchNext** method from class SWResult. If **fetchNext** returns YES means retrieve a row successfully, NO means no more data.
```
SWResult *result = [db querySQL:@"select id, id2 from sample"];
if ([result fetchNext]) {
  NSInteger theId = [result asIntegerWithColumnIndex: 0];
  // theId stores the value of field `id` from the first row retrieved
}
```
