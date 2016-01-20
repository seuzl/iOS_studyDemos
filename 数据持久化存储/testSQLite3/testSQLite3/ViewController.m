//
//  ViewController.m
//  testSQLite3
//
//  Created by 赵磊 on 16/1/20.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"
#import "Word.h"
#import "resultVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//打开数据库，添加生词

- (IBAction)addWord:(id)sender {
    
    NSString* word = self.wordTextField.text;
    NSString* detail = self.detailTextfield.text;
    
    if (word != nil && detail.length > 0 && detail != nil && detail.length > 0) {
//        1⃣️定义一个数据库指针
        sqlite3* database;
//        2⃣️打开与 fileName (这里用了绝对路径dbPath) 关联的数据库连接
        sqlite3_open([[self dbPath] UTF8String], &database);
        
//        定义错误字符串
        char* errMsg;
        
//        定义 DDL(create table)
        const char* createSQL = "createaa table if not exists word_inf \(_id integer primary key autoincrement,\ word, \detail)";
//        3⃣️执行ddl语句
        int result = sqlite3_exec(database, createSQL, NULL, NULL, &errMsg);
        
//        ⚠️⚠️⚠️对于 DDL 和 DML 都是可以直接用 exec()执行的，但如果是 DQL(查询)必须先经过预编译
        
        if (result == SQLITE_OK) {
//            insert语句
            const char* insertSQL = "insert into word_inf values(null,?,?) ";
            sqlite3_stmt * stmt;
//          3⃣️ 预编译sql,stmt保存预编译结果
            int insertResult = sqlite3_prepare_v2(database, insertSQL, -1, &stmt, nil);
           
            if (insertResult == SQLITE_OK) {
//          4⃣️绑定占位符
                sqlite3_bind_text(stmt, 1, [word UTF8String], -1, NULL);
                sqlite3_bind_text(stmt, 2, [detail UTF8String], -1, NULL);
//          5⃣️执行DML（insert / update / delete）
                sqlite3_step(stmt);
            }
//          6⃣️关闭 stmt
            sqlite3_finalize(stmt);
            
        }else{
            NSLog([NSString stringWithUTF8String:errMsg]);
        }
//          7⃣️关闭数据库
        sqlite3_close(database);
        
    }

}


//打开数据库，查询

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString* key = self.keyTextField.text;
    if (key != nil && key.length > 0) {
        
        sqlite3* database;
        sqlite3_open([[self dbPath] UTF8String], &database);
    
        const char * selectSQL = "select * from word_inf where word like ?";
        
        sqlite3_stmt* stmt;
        int queryResult = sqlite3_prepare_v2(database, selectSQL, -1, &stmt, nil);
        
        NSMutableArray* result = [[NSMutableArray alloc]init];
        
        if (queryResult == SQLITE_OK) {
            sqlite3_bind_text(stmt, 1, [[NSString stringWithFormat:@"%%%@%%",key] UTF8String], -1, NULL);
            
//           注⚠️:[%%%@%%]解析结果是 %key%， %在sql表示通配符，可匹配任意多个字符。说明要查询的结果是只要word中有key就可以。
            
//            循环多次执行 step ，从中取出查询效果
            while (sqlite3_step(stmt) == SQLITE_ROW) {
//                分别获取当前行的不同列的查询数据
                int word_int = sqlite3_column_int(stmt, 0);
                char* word = (char*)sqlite3_column_text(stmt, 1);
                char* detail = (char*)sqlite3_column_text(stmt, 2);
                
                Word* wordObj = [[Word alloc]initWithID:word_int word:[NSString stringWithUTF8String:word] detail:[NSString stringWithUTF8String:detail]];
                [result addObject:wordObj];
                
            }
        }
        
        sqlite3_finalize(stmt);
        
        sqlite3_close(database);
        
        resultVC* resultvc = (resultVC*)segue.destinationViewController;
        resultvc.array = result;
    
    }

}

//获取数据库文件的保存路径:Documents
-(NSString*)dbPath
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documenDirectory = [paths objectAtIndex:0];
//    Documents 目录下没有"myWords.db"的话会新建
    return [NSString stringWithFormat:@"%@/myWords.db",documenDirectory];
}


- (IBAction)finishEdit:(id)sender {
    [sender resignFirstResponder];
}






@end
