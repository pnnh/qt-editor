#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "md5.h"
#include "wasm/wasm.h"
#include <iostream>
#include "sqlite/sqlite.h"

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;
  const QUrl url(QStringLiteral("qrc:/src/qrc/textfield.qml"));

  engine.load(url);

  if (engine.rootObjects().isEmpty())
    return -1;

//  std::cout << "compare: " << compareBig(100, 30) << endl;
//  std::cout << "计算MD5：" << calcMd5("啊哈哈abc") << endl;

  runSqlite(argc, argv);

  return app.exec();
}

