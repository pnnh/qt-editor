//
// Created by Larry on 2021/12/19.
//

#ifndef QT_EDITOR_SQLITE_H
#define QT_EDITOR_SQLITE_H

#include <QString>

typedef struct  //假定数据库存储内容
{
  QString UserName;
  QString IP;
  QString Port;
  QString PassWord;
  QString Type;

} TestInfo;

QVector<TestInfo> runSqlite();

#endif //QT_EDITOR_SQLITE_H
