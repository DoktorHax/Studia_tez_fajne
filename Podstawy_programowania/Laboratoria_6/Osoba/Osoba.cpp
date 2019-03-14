#include <iostream>
#include "class.h"
using namespace std;

int main(){
    Osoba Karol;
    Karol.ustawWszystko("Karol",21);
    Karol.wypiszWszystko();
    cout<<Karol.wypiszWiek()<<endl;

    Kobieta Alicja;
    Alicja.ustawWszystko("Alicja",18);
    Alicja.wypiszWszystko();
    cout<<Alicja.wypiszImie()<<endl;
    cout<<Alicja.wypiszWiek()<<endl;

    return 0;
}