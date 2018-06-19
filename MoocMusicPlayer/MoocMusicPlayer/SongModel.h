#ifndef SONGMODEL_H
#define SONGMODEL_H
#include <QAbstractListModel>
#include <QtCore>

class Song

{
public:
    Song(QUrl path, bool isFolder);
    QString getName() const;
    QUrl getPath() const;
    bool getType() const;

private:
    QString name;
    QUrl path;
    bool isFolder;

};



class SongModel : public QAbstractListModel
{
    Q_OBJECT

public:

    enum SongRoles {
        name = Qt::UserRole + 1,
        path,
        isFolder

    };

    SongModel(QObject * parent = 0);
    void addSong(const QUrl fullPath, bool isFolder);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    Q_INVOKABLE void addSongFromQML(const QUrl fullPath, bool isFolder);


//    Q_INVOKABLE QString nameAtIndex(int index);

public slots:


signals:
    void musicsPathChanged(QString musicsPath);




protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<Song> listSong;



};

#endif // SONG_H


