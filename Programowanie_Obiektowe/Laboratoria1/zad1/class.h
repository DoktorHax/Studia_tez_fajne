#include <iostream>
using namespace std;

class Shape{
    public:
    int x;
    int y;
    int area(){
        return x*y;
    }
    void WymT(){
        cout<<"Podaj podstawe trojkata: ";
        cin>>x;
        cout<<"Podaj wysokosc trojkata: ";
        cin>>y;
    }
    void WymR(){
        cout<<"Podaj bok a prostokata: ";
        cin>>x;
        cout<<"Podaj bok b prostokata: ";
        cin>>y;
    }
    void wyswietl(){
        cout<<"Pole = "<<area()<<endl;
    }
};

class Triangle:public Shape{
    public:
    int area(){
        return (x*y)/2;
    }
    void wyswietl(){
        cout<<"Pole trojkata = "<<area()<<endl<<endl;
    }
};
class Rectangle:public Shape{
    public:
    void wyswietl(){
        cout<<"Pole prostokata = "<<area()<<endl<<endl;
    }
};