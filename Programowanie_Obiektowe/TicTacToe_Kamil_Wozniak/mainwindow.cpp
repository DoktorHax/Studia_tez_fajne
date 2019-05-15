#include "mainwindow.h"
#include "ui_mainwindow.h"

static QString players[3];
static char square[3][3]={{'\0'}};
static char win='\0';
static int chanc=0;
static int player=1;
static int start=0;
static int mode=2;

MainWindow::MainWindow(QWidget*parent):
    QMainWindow(parent),
    ui(new Ui::MainWindow){
        ui->setupUi(this);
        this->setWindowTitle("Tic Tac Toe");
        ui->radioButton->setVisible(0);
        ui->radioButton_2->setVisible(0);
        ui->label_5->setVisible(0);
        ui->lineEdit_3->setVisible(0);
        ui->pushButton_4->setVisible(0);
}

MainWindow::~MainWindow(){
    delete ui;
}

char checkwin(){
    win='\0';
    for(int i=0;i<3;i++){
        if(square[i][0]==square[i][1]&&square[i][1]==square[i][2]&&square[i][1]!='\0'){
            win=square[i][1];
            break;
        }
        if(square[0][i]==square[1][i]&&square[1][i]==square[2][i]&&square[1][i]!='\0'){
            win=square[1][i];
            break;
        }
    }
    if(square[0][0]==square[1][1]&&square[1][1]==square[2][2]&&square[1][1]!='\0')
        win=square[1][1];
    if(square[0][2]==square[1][1]&&square[1][1]==square[2][0]&&square[1][1]!='\0')
        win=square[1][1];
    return win;
}
int chmv(char player1, char player2);
int cpmove(char player1, char player2){

    int bms=-99;
    int ro=-99;
    int cl=-99;
    int scor=0;

    for (int r=0; r<3; r++){
        for (int c=0; c<3; c++){
            if (square[r][c]=='\0'){
                square[r][c]=player1;
                scor=-(chmv(player2, player1));
                square[r][c]='\0';
                if (scor>=bms){
                    bms=scor;
                    ro=r;
                    cl=c;
                }
            }
        }
    }
    return (10*ro+cl);
}

int chmv(char player1, char player2){

    int bms=-99;
    int scor=0;

    if (checkwin()==player1)
        return 1000;

    else if (checkwin()==player2)
        return -1000;

    for (int r=0; r<3; r++){
        for (int c=0; c<3; c++){
            if (square[r][c]=='\0'){
                square[r][c]=player1;
                scor=-(chmv(player2, player1));
                square[r][c]='\0';
                if (scor>=bms)
                    bms=scor;
            }
        }
    }
    if (bms==-9999||bms==0)
        return 0;
    else if (bms>0)
        return bms-1;
    else if (bms<0)
        return bms+1;
}

void MainWindow::chplayer(){
    win='\0';
    for(int i=0;i<3;i++){
        if(square[i][0]==square[i][1]&&square[i][1]==square[i][2]&&square[i][1]!='\0'){
            win=square[i][1];
            break;
        }
        if(square[0][i]==square[1][i]&&square[1][i]==square[2][i]&&square[1][i]!='\0'){
            win=square[1][i];
            break;
        }
    }
    if(square[0][0]==square[1][1]&&square[1][1]==square[2][2]&&square[1][1]!='\0')
        win=square[1][1];
    if(square[0][2]==square[1][1]&&square[1][1]==square[2][0]&&square[1][1]!='\0')
        win=square[1][1];
    if(win=='X'){
        start=0;
        ui->label_4->setText("Wygrywa: "+players[1]);
        return;
    }
    if(win=='O'){
        start=0;
        ui->label_4->setText("Wygrywa: "+players[2]);
        return;
    }
    chanc++;
    if(chanc==9){
        ui->label_4->setText("Zremisowano");
        chanc=0;
        start=0;
        return;
    }
    if(player==1)
        player=2;
    else
        player=1;
    ui->label_4->setText("Ruch "+players[player]);
    if(mode==1&&player==2){
        int mv=cpmove('O','X');
        int ro=mv/10;
        int cl=mv%10;
        square[ro][cl]='O';
        switch(mv){
            case 00:
                ui->toolButton->setText("O");
                break;
            case 01:
                ui->toolButton_2->setText("O");
                break;
            case 02:
                ui->toolButton_3->setText("O");
                break;
            case 10:
                ui->toolButton_4->setText("O");
                break;
            case 11:
                ui->toolButton_5->setText("O");
                break;
            case 12:
                ui->toolButton_6->setText("O");
                break;
            case 20:
                ui->toolButton_7->setText("O");
                break;
            case 21:
                ui->toolButton_8->setText("O");
                break;
            case 22:
                ui->toolButton_9->setText("O");
                break;
        }
        chplayer();
    }
}

void MainWindow::on_toolButton_clicked(){
    if(ui->toolButton->text()==""&&start==1){
        if(player==1){
            ui->toolButton->setText("X");
            square[0][0]='X';
            chplayer();
        }
        else{
            ui->toolButton->setText("O");
            square[0][0]='O';
            chplayer();
        }
    }
}
void MainWindow::on_toolButton_2_clicked(){
    if(ui->toolButton_2->text()==""&&start==1){
        if(player==1){
            ui->toolButton_2->setText("X");
            square[0][1]='X';
            chplayer();
        }
        else{
            ui->toolButton_2->setText("O");
            square[0][1]='O';
            chplayer();
        }
    }
}
void MainWindow::on_toolButton_3_clicked(){
    if(ui->toolButton_3->text()==""&&start==1){
        if(player==1){
            ui->toolButton_3->setText("X");
            square[0][2]='X';
            chplayer();
        }
        else{
            ui->toolButton_3->setText("O");
            square[0][2]='O';
            chplayer();
        }
    }
}
void MainWindow::on_toolButton_4_clicked(){
    if(ui->toolButton_4->text()==""&&start==1){
        if(player==1){
            ui->toolButton_4->setText("X");
            square[1][0]='X';
            chplayer();
        }
        else{
            ui->toolButton_4->setText("O");
            square[1][0]='O';
            chplayer();
        }
    }
}
void MainWindow::on_toolButton_5_clicked(){
    if(ui->toolButton_5->text()==""&&start==1){
        if(player==1){
            ui->toolButton_5->setText("X");
            square[1][1]='X';
            chplayer();
        }
        else{
            ui->toolButton_5->setText("O");
            square[1][1]='O';
            chplayer();
        }
    }
}
void MainWindow::on_toolButton_6_clicked(){
    if(ui->toolButton_6->text()==""&&start==1){
        if(player==1){
            ui->toolButton_6->setText("X");
            square[1][2]='X';
            chplayer();
        }
        else{
            ui->toolButton_6->setText("O");
            square[1][2]='O';
            chplayer();
        }
    }
}
void MainWindow::on_toolButton_7_clicked(){
    if(ui->toolButton_7->text()==""&&start==1){
        if(player==1){
            ui->toolButton_7->setText("X");
            square[2][0]='X';
            chplayer();
        }
        else{
            ui->toolButton_7->setText("O");
            square[2][0]='O';
            chplayer();
        }
    }
}
void MainWindow::on_toolButton_8_clicked(){
    if(ui->toolButton_8->text()==""&&start==1){
        if(player==1){
            ui->toolButton_8->setText("X");
            square[2][1]='X';
            chplayer();
        }
        else{
            ui->toolButton_8->setText("O");
            square[2][1]='O';
            chplayer();
        }
    }
}
void MainWindow::on_toolButton_9_clicked(){
    if(ui->toolButton_9->text()==""&&start==1){
        if(player==1){
            ui->toolButton_9->setText("X");
            square[2][2]='X';
            chplayer();
        }
        else{
            ui->toolButton_9->setText("O");
            square[2][2]='O';
            chplayer();
        }
    }
}

void MainWindow::on_pushButton_clicked(){
    player=1;
    win='\0';
    chanc=0;
    if(mode==2)
    players[1]=ui->lineEdit->text();
    players[2]=ui->lineEdit_2->text();
    if(mode==1){
        players[2]="CPU";
    }
    ui->radioButton->setVisible(0);
    ui->radioButton_2->setVisible(0);
    ui->label->setVisible(0);
    ui->label_2->setVisible(0);
    ui->label_5->setVisible(0);
    ui->lineEdit->setVisible(0);
    ui->lineEdit_2->setVisible(0);
    ui->lineEdit_3->setVisible(0);
    ui->pushButton_4->setVisible(0);
    ui->label_8->setText(players[1]+" VS "+players[2]);
    if(players[1]==""||players[2]==""){
        ui->label_4->setText("Wypisz nazwy graczy");
    }
    else{
        ui->label_4->setText("Ruch "+players[1]);
        start=1;
    }
    win='\0';
    for(int i=0;i<3;i++)
        for(int j=0;j<3;j++)
            square[i][j]={'\0'};
    ui->toolButton->setText("");
    ui->toolButton_2->setText("");
    ui->toolButton_3->setText("");
    ui->toolButton_4->setText("");
    ui->toolButton_5->setText("");
    ui->toolButton_6->setText("");
    ui->toolButton_7->setText("");
    ui->toolButton_8->setText("");
    ui->toolButton_9->setText("");
}
void MainWindow::on_pushButton_2_clicked(){
    win='\0';
    player=1;
    chanc=0;
    for(int i=0;i<3;i++)
        for(int j=0;j<3;j++)
            square[i][j]={'\0'};
    ui->toolButton->setText("");
    ui->toolButton_2->setText("");
    ui->toolButton_3->setText("");
    ui->toolButton_4->setText("");
    ui->toolButton_5->setText("");
    ui->toolButton_6->setText("");
    ui->toolButton_7->setText("");
    ui->toolButton_8->setText("");
    ui->toolButton_9->setText("");
    start=1;
    ui->label_4->setText("Ruch "+players[1]);
}
void MainWindow::on_pushButton_3_clicked(){
    if(ui->radioButton->isVisible()==true){
        ui->radioButton->setVisible(0);
        ui->radioButton_2->setVisible(0);
    }
    else{
        ui->radioButton->setVisible(1);
        ui->radioButton_2->setVisible(1);
    }
}
void MainWindow::on_pushButton_4_clicked(){
    if(ui->lineEdit_3->text()=="")
        return;
    if(mode==1){
        players[1]=ui->lineEdit_3->text();
        players[2]="CPU";
        ui->label_4->setText("Aby wysłać wojownika\ndo walki należy kliknąć\n[Start]");
        return;
    }
}

void MainWindow::on_radioButton_clicked(){
    mode=1;
    ui->label->setVisible(0);
    ui->label_2->setVisible(0);
    ui->lineEdit->setVisible(0);
    ui->lineEdit_2->setVisible(0);
    ui->label_6->setText("Player VS CPU");
    ui->label_5->setVisible(1);
    ui->lineEdit_3->setVisible(1);
    ui->pushButton_4->setVisible(1);
}
void MainWindow::on_radioButton_2_clicked(){
    mode=2;
    ui->label->setVisible(1);
    ui->label_2->setVisible(1);
    ui->lineEdit->setVisible(1);
    ui->lineEdit_2->setVisible(1);
    ui->label_6->setText("Player VS Player");
    ui->label_5->setVisible(0);
    ui->lineEdit_3->setVisible(0);
    ui->pushButton_4->setVisible(0);
}

void MainWindow::on_lineEdit_3_returnPressed(){
    if(ui->lineEdit_3->text()=="")
        return;
    if(mode==1){
        players[1]=ui->lineEdit_3->text();
        players[2]="CPU";
        return;
    }
}
