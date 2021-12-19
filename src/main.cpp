#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "md5.h"
#include "wasm/wasm.h"
#include <iostream>
#include "sqlite/sqlite.h"
#include "models/videoListModel.h"

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);
  qmlRegisterType<VideoListModel>("an.qt.CModel", 1, 0, "VideoListModel");


  QQmlApplicationEngine engine;
  const QUrl url(QStringLiteral("qrc:/src/qrc/list_videos.qml"));

  engine.load(url);

  if (engine.rootObjects().isEmpty())
    return -1;

//  std::cout << "compare: " << compareBig(100, 30) << endl;
//  std::cout << "计算MD5：" << calcMd5("啊哈哈abc") << endl;

  return app.exec();
}

