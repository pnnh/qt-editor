//
// Created by Larry on 2021/12/19.
//

#include "sqlite.h"
#include <QtWidgets/QApplication>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlRecord>
#include <QSqlError>

const QString TableUsers = "users";

QVector<TestInfo> runSqlite() {
  QVector<TestInfo> infoVect; //testInfo向量，用于存储数据库查询到的数据

  QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");

  auto dbName = QApplication::applicationDirPath() + "/data.sqlite";
  db.setDatabaseName(dbName);
  if (!db.open()) {
    qDebug() << "打开数据库文件出错: " << db.lastError().text();
    return infoVect;
  }

/**************************使用QSqlQuery操作数据库**************************/
  QSqlQuery query;    //执行操作类对象

  //判断表是否已经存在
  QString sql = QString("select * from sqlite_master where name='%1'").arg(TableUsers);
  if (!query.exec(sql)) {
    qDebug() << "检查表是否存在出错: " << query.lastError().text();
    return infoVect;
  }
  QString columnName;
  if (query.next()) {
    columnName = query.value("name").toString();
  }
  if (columnName != TableUsers) {
    auto createSql = QString("CREATE TABLE %1("
                             "UserName VARCHAR,"
                             "IP VARCHAR,"
                             "PassWord VARCHAR,"
                             "Type VARCHAR,"
                             "Port VARCHAR)").arg(TableUsers);
    if (!query.exec(createSql)) {
      qDebug() << "创建表出错: " << query.lastError().text();
      //qDebug() << "Database Error: " << query.lastError().text();
      return infoVect;
    }
  }

  //查询数据
  auto querySql = QString("SELECT * FROM %1").arg(TableUsers);
  query.prepare(querySql);
  query.exec();    //执行

  QSqlRecord recode = query.record();        //recode保存查询到一些内容信息，如表头、列数等等
  int column = recode.count();            //获取读取结果的列数
  QString s1 = recode.fieldName(0);        //获取第0列的列名

  while (query.next()) {
    TestInfo tmp;
    tmp.UserName = query.value("UserName").toString();
    tmp.IP = query.value("IP").toString();
    tmp.Port = query.value("Port").toString();
    tmp.PassWord = query.value("PassWord").toString();
    tmp.Type = query.value("Type").toString();

    infoVect.push_back(tmp);   //将查询到的内容存到testInfo向量中
  }

  for (int i = 0; i < infoVect.size(); i++)    //打印输出
  {
    qDebug() << infoVect[i].UserName << ":"    \
 << infoVect[i].IP << ":"        \
 << infoVect[i].Port << ":"        \
 << infoVect[i].PassWord << ":" \
 << infoVect[i].Type;
  }

  //插入数据


  //更改表中 UserName=user4 的Type属性为admin
  query.prepare("UPDATE posts SET Type='admin' WHERE UserName='user4'");
  query.exec();

  //删除表中 UserName=user4的用户信息
  //auto deleteSql = QString("DELETE FROM %1 WHERE UserName='user4'").arg(TableUsers);
//  query.prepare(deleteSql);
//  query.exec();

  return infoVect;
}

void addInfo(TestInfo info) {
    QSqlQuery query;
    auto insertSql = QString("INSERT INTO %1 (UserName, IP, Port, PassWord, Type)"
                             "VALUES (:UserName, :IP, :Port, :PassWord, :Type)").arg(TableUsers);
    query.prepare(insertSql);
    query.bindValue(":UserName", info.UserName);    //给每个插入值标识符设定具体值
    query.bindValue(":IP", "192.168.1.5");
    query.bindValue(":Port", "5004");
    query.bindValue(":PassWord", "55555");
    query.bindValue(":Type", "operator");
    auto insertResult = query.exec();

    qDebug() << "insertResult: " << query.lastError().text();
}
