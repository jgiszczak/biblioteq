#ifndef _BIBLIOTEQ_VIDEOGAME_H_
#define _BIBLIOTEQ_VIDEOGAME_H_

#include "biblioteq_item.h"
#include "ui_biblioteq_videogameinfo.h"

class biblioteq_videogame: public QMainWindow, public biblioteq_item
{
  Q_OBJECT

 public:
  biblioteq_videogame(biblioteq *parentArg,
		      const QString &oidArg,
		      const QModelIndex &index);
  ~biblioteq_videogame();
  void duplicate(const QString &p_oid, const int state);
  void insert(void);
  void modify(const int state);
  void search(const QString &field = "", const QString &value = "");

  void setPublicationDateFormat(const QString &dateFormat)
  {
    vg.release_date->setDisplayFormat(dateFormat);
  }

  void updateWindow(const int state);

 private:
  QString m_engWindowTitle;
  Ui_vgDialog vg;
  void changeEvent(QEvent *event);
  void closeEvent(QCloseEvent *event);

 private slots:
  void slotCancel(void);
  void slotGo(void);
  void slotPopulateCopiesEditor(void);
  void slotPrint(void);
  void slotPublicationDateEnabled(bool state);
  void slotQuery(void);
  void slotReset(void);
  void slotSelectImage(void);
  void slotShowUsers(void);
};

#endif
