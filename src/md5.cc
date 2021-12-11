//
// Created by Larry on 2021/12/11.
//

#include "md5.h"
#include <QtCore>

string md5::calcMd5(string) {
  QString md5;
  QString pwd="123456";
  QByteArray bb;

  bb = QCryptographicHash::hash (pwd.toUtf8(), QCryptographicHash::Md5 );
  md5.append(bb.toHex());

  return md5.toStdString();
}
