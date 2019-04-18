#include <iostream>
using namespace std;

class KlasaBazowa{
public:
    virtual void display(){
        cout<<"Klasa bazowa"<<endl;
    }
};

class KlasaPochodna:public KlasaBazowa{
public:
    virtual void display(){
        cout<<"Klasa pochodna"<<endl;
    }
};

int main(){
    KlasaBazowa*o1=new KlasaBazowa();
    o1->display();

    KlasaPochodna*o2=new KlasaPochodna();
    o2->display();

    KlasaBazowa*o3=new KlasaPochodna();
    o3->display();

    return 0;
}
