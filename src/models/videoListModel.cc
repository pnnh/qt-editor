//
// Created by Larry on 2021/11/25.
//

#include "videoListModel.h"
#include <QXmlStreamReader>
#include <QVector>
#include <QFile>
#include <QDebug>
#include <QStringView>
#include "src/sqlite/sqlite.h"

typedef QVector<QString> VideoData;
class VideoListModelPrivate {
 public:
  VideoListModelPrivate() : m_bError(false) {
    int role = Qt::UserRole;
    m_roleNames.insert(role++, "name");
  }
  ~VideoListModelPrivate() {
    clear();
  }
  void load() {
//    VideoData *video;
//    int index = 0;
//    while (index++ < 10) {
//      video = new VideoData();
//      video->append("name " );
//      m_videos.append(video);
//    }
    VideoData *video;
    auto dataVector = runSqlite();
    QVectorIterator<TestInfo> dataIterator(dataVector);
    while (dataIterator.hasNext()) {
      auto info = dataIterator.next();
      qDebug() << "info ==" << info.UserName;

      video = new VideoData();
      video->append("name " + info.UserName);
      m_videos.append(video);
    }

  }
  void reset() {
    m_bError = false;
    m_strError.clear();
    clear();
  }
  void clear() {
    int count = m_videos.size();
    if (count > 0) {
      for (int i = 0; i < count; i++) {
        delete m_videos.at(i);
      }
      m_videos.clear();
    }
  }
  QString m_strXmlFile;
  QString m_strError;
  bool m_bError;
  QHash<int, QByteArray> m_roleNames;
  QVector<VideoData *> m_videos;
};

VideoListModel::VideoListModel(QObject *parent) : QAbstractListModel(parent),
                                                  m_dptr(new VideoListModelPrivate) {

}
VideoListModel::~VideoListModel() {
  delete m_dptr;
}
int VideoListModel::rowCount(const QModelIndex &parent) const {
  return m_dptr->m_videos.size();
}
QVariant VideoListModel::data(const QModelIndex &index, int role) const {
  VideoData *d = m_dptr->m_videos[index.row()];
  return d->at(role - Qt::UserRole);
}
QHash<int, QByteArray> VideoListModel::roleNames() const {
  return m_dptr->m_roleNames;
}
QString VideoListModel::source() const {
  return m_dptr->m_strXmlFile;
}
void VideoListModel::setSource(const QString &filePath) {
  m_dptr->m_strXmlFile = filePath;
  reload();
  if (m_dptr->m_bError) {
    qDebug() << "VideoListModel, error - " << m_dptr->m_strError;
  }
}

QString VideoListModel::errorString() const {
  return m_dptr->m_strError;
}
bool VideoListModel::hasError() const {
  return m_dptr->m_bError;
}
void VideoListModel::reload() {
  beginResetModel();
  m_dptr->reset();
  m_dptr->load();
  endResetModel();
}
void VideoListModel::remove(int index) {
  beginRemoveRows(QModelIndex(), index, index);
  delete m_dptr->m_videos.takeAt(index);
  endRemoveRows();
}
