//
// Created by Larry on 2021/12/19.
//

#include "sqlite.h"
#include <QtWidgets/QApplication>
#include <QCoreApplication>
#include <QDebug>

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlRecord>
#include <QSqlError>

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
  QString sql = QString("select * from sqlite_master where name='%1'").arg("T_USER_MANAGE");
  if(!query.exec(sql)){
    qDebug() << "检查表是否存在出错: " << query.lastError().text();
    return infoVect;
  }
  QString columnName;
  if (query.next()) {
    columnName = query.value("name").toString();
  }
  if (columnName != "T_USER_MANAGE") {
    if (!query.exec("CREATE TABLE T_USER_MANAGE("
                    "UserName VARCHAR,"
                    "IP VARCHAR,"
                    "PassWord VARCHAR,"
                    "Type VARCHAR,"
                    "Port VARCHAR)")) {
      qDebug() << "创建表出错: " << query.lastError().text();
      //qDebug() << "Database Error: " << query.lastError().text();
      return infoVect;
    }
  }

  //查询数据
  query.prepare("SELECT * FROM T_USER_MANAGE");
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
  query.prepare(
      "INSERT INTO T_USER_MANAGE (UserName, IP, Port, PassWord, Type) VALUES (:UserName, :IP, :Port, :PassWord, :Type)");
  query.bindValue(":UserName", "user4");    //给每个插入值标识符设定具体值
  query.bindValue(":IP", "192.168.1.5");
  query.bindValue(":Port", "5004");
  query.bindValue(":PassWord", "55555");
  query.bindValue(":Type", "operator");
  auto insertResult = query.exec();

  qDebug() << "insertResult: " << query.lastError().text();


  //更改表中 UserName=user4 的Type属性为admin
  query.prepare("UPDATE T_USER_MANAGE SET Type='admin' WHERE UserName='user4'");
  query.exec();

  //删除表中 UserName=user4的用户信息
//  query.prepare("DELETE FROM T_USER_MANAGE WHERE UserName='user4'");
//  query.exec();

  return infoVect;
}