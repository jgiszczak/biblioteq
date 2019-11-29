#ifndef _BIBLIOTEQ_PHOTOGRAPH_VIEW_H_
#define _BIBLIOTEQ_PHOTOGRAPH_VIEW_H_

#include <QGraphicsView>

class biblioteq_photograph_view: public QGraphicsView
{
  Q_OBJECT

 public:
  biblioteq_photograph_view(QWidget *parent);
  void setBestFit(const bool bestFit);
  void setImage(const QImage &image);

 private:
  QImage m_image;
  bool m_bestFit;
  void resizeEvent(QResizeEvent *event);
};

#endif