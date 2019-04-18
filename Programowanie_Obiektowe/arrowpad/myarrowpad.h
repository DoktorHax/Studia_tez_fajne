#ifndef MYARROWPAD_H
#define MYARROWPAD_H

#endif // MYARROWPAD_H

#include "arrowpad.h"
#define I_INDEX "i"
#define J_INDEX "j"
#define SELECTED_BUTTON "selected"
#define WIDTH 20
#define HEIGHT 20
#define WINNING_LENGTH 5
#define X_SIGN "X"
#define O_SIGN "O"

class MyArrowPad: public ArrowPad{
Q_OBJECT
public:
    int moveNr=0;
    int gameBoard[WIDTH][HEIGHT];
    MyArrowPad();
    virtual ~ MyArrowPad();
    MyArrowPad(QWidget *parent);
    QPushButton * rightButton;  // To powinno być zastąpione przez tablicę pamiętającą wszystkie przyciski lub tablicę znaków (int) zapamiętujących stany przycisków
public slots:
    void  onClick();
};
