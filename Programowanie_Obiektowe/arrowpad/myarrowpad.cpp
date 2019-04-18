/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include <QtWidgets>

#include "myarrowpad.h"



ArrowPad::ArrowPad(QWidget *parent)
    : QWidget(parent)
{

};

void  MyArrowPad::onClick(){

    QPushButton* buttonSender = qobject_cast<QPushButton*>(sender()); // retrieve the button you have clicked
    QString q=O_SIGN;
    if(moveNr%2){
        q=X_SIGN;
    }

    if(buttonSender->property(SELECTED_BUTTON)==""){
        /*QMessageBox msgBox;
        msgBox.setText( buttonSender->property(I_INDEX).toString() +  "  "+ buttonSender->property(J_INDEX).toString());
        msgBox.setInformativeText("Własnie został wybrany");
        msgBox.setStandardButtons(
                    QMessageBox::Ok);
        msgBox.setDefaultButton(QMessageBox::Ok);
        int ret = msgBox.exec();*/
        buttonSender->setText(q);
        buttonSender->setProperty(SELECTED_BUTTON,q);
        gameBoard[buttonSender->property(
                    I_INDEX).toString().toInt()][buttonSender->property(J_INDEX).toString().toInt()]=moveNr%2;


        moveNr++;
    }
    else{
        QMessageBox msgBox;
        msgBox.setText( buttonSender->property(I_INDEX).toString() +  "  "+ buttonSender->property(J_INDEX).toString());
        msgBox.setInformativeText("Nie może być klikniety");
        msgBox.setStandardButtons(
                    QMessageBox::Ok);
        msgBox.setDefaultButton(QMessageBox::Ok);
        int ret = msgBox.exec();
    }

    for(int player=0;player<=1;player++){
        //SPRAWDZANIE W PIONIE
    for(int i=0;i<WIDTH;i++){

        for(int k=0;k<=HEIGHT-WINNING_LENGTH;k++){
                    bool winner=true;
            for(int l=k;l<k+WINNING_LENGTH;l++ ){
                if(gameBoard[i][l]!=player){
                    winner=false;
                    printf("%d %d %d \n",i,l,gameBoard[i][l]        );
                }
            }

        if(winner){
            QMessageBox msgBox;
            msgBox.setText( "GRACZ "+QString(player)+ "WYGRAŁ");
            msgBox.setInformativeText("KONIEC");
            msgBox.setStandardButtons(
                        QMessageBox::Ok);
            msgBox.setDefaultButton(QMessageBox::Ok);
            int ret = msgBox.exec();

        }
        }
    }
    }

}


MyArrowPad::~MyArrowPad()
{
};

MyArrowPad::MyArrowPad()
    : ArrowPad()
{
    //! [0]
    //    upButton = new QPushButton(tr("&Up"));
    //! [0] //! [1]
    //    downButton = new QPushButton(tr("&Down"));
    //! [1] //! [2]
    //    leftButton = new QPushButton(tr("&Left"));
    //! [2] //! [3]
    //! [3]


    QGridLayout *mainLayout = new QGridLayout;
    for(int i=0;i<WIDTH;i++){
        for(int j=0;j<HEIGHT;j++){
            //                if((i+j)%2){
            rightButton = new QPushButton("");
            //                }
            //                else{
            //                    rightButton = new QPushButton("O");

            //                }
            rightButton->setProperty(I_INDEX,i);
            rightButton->setProperty(J_INDEX,j);
            gameBoard[i][j]=10;
            rightButton->setProperty(SELECTED_BUTTON,"");
            connect(rightButton, SIGNAL (released()), this, SLOT (onClick()));
            mainLayout->addWidget(rightButton,i,j);

            //    mainLayout->addWidget(upButton, i, j);
            //    mainLayout->addWidget(leftButton, 1, 0);
            //    mainLayout->addWidget(rightButton, 1, 2);
            //    mainLayout->addWidget(downButton, 2, 1);
        }}
    setLayout(mainLayout);
}
;


MyArrowPad::MyArrowPad(QWidget *parent)
    : ArrowPad(parent)
{
    //! [0]
    //    upButton = new QPushButton(tr("&Up"));
    //! [0] //! [1]
    //    downButton = new QPushButton(tr("&Down"));
    //! [1] //! [2]
    //    leftButton = new QPushButton(tr("&Left"));
    //! [2] //! [3]
    //! [3]


    QGridLayout *mainLayout = new QGridLayout;
    for(int i=0;i<WIDTH;i++){
        for(int j=0;j<HEIGHT;j++){
            if((i+j)%2){
                rightButton = new QPushButton(X_SIGN);
            }else{
                rightButton = new QPushButton(O_SIGN);
            }
            rightButton->setProperty("i",i);
            rightButton->setProperty("j",j);
            connect(rightButton, SIGNAL (released), this, SLOT (onCLick()));
            mainLayout->addWidget(rightButton,i,j);

            //    mainLayout->addWidget(upButton, i, j);
            //    mainLayout->addWidget(leftButton, 1, 0);
            //    mainLayout->addWidget(rightButton, 1, 2);
            //    mainLayout->addWidget(downButton, 2, 1);
        }}
    setLayout(mainLayout);
}



