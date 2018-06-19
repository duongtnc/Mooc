#include "SongModel.h"

Song::Song(const QUrl fullPath, bool isFolder)
{
    this->name = fullPath.fileName();

    this->path = fullPath;

    this->isFolder = isFolder;


//    qDebug() << "source: ";
//    qDebug() << fullPath;
//     qDebug() << "name: ";
//    qDebug() << this->name;
//    qDebug() << "fullpath: ";
//    qDebug() << this->path;
}

QString Song::getName() const
{
    return name;
}

QUrl Song::getPath() const
{
    return path;
}

bool Song::getType() const
{
    return isFolder;
}



SongModel::SongModel(QObject * parent):QAbstractListModel(parent)
{

}
void SongModel::addSong(const QUrl fullPath, bool isFolder)
{
    const Song * song = new Song(fullPath, isFolder);
    qDebug() << "fullPath: ";
    qDebug() << fullPath;
    if(isFolder) {

        beginInsertRows(QModelIndex(), 0, 0);
        listSong.insert(0, *song);
//        listSong << *song;
        endInsertRows();
    }else {

        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        listSong.insert(rowCount(), *song);
        endInsertRows();
    }
}

QVariant SongModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= listSong.count())
        return QVariant();

    const Song &song = listSong[index.row()];
    if(role == name)
        return song.getName();
    if(role == path)
        return song.getPath();
    if(role == isFolder)
        return song.getType();
    return QVariant();
}

void SongModel::addSongFromQML(const QUrl fullPath, bool isFolder)
{
    this->addSong(fullPath, isFolder);
}



//QString SongModel::nameAtIndex(int index)
//{
//    if(index >=0 && index < listSong.count()){
//        return listSong[index];
//    }else {
//        return listSong[0];
//    }
//}


int SongModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return listSong.count();
}
QHash<int, QByteArray> SongModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[name] = "name";
    roles[path] = "path";
    roles[isFolder] = "isFolder";
    return roles;
}
//listview.currentindex = listvirew.indexat(contetnX + 35, contetnY + 30)
//listview.currentindex = listvirew.indexat(contetnX + 35, contetnY + 30)
//listview.currentindex = listvirew.indexat(contetnX + 35, contetnY + 30)
//listview.currentindex = listvirew.indexat(contetnX + 35, contetnY + 30)
//listview.currentindex = listvirew.indexat(contetnX + 35, contetnY + 30)
//listview.currentindex = listvirew.indexat(contetnX + 35, contetnY + 30)


