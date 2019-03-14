#include <iostream>
using namespace std;

class Osoba{
    protected:
        string imie;
        int wiek;
    public:
        void ustawWszystko(string imie, int wiek){
            this->imie=imie;
            this->wiek=wiek;
        }
        void wypiszWszystko();
        int wypiszWiek();
        string wypiszImie();
        // Osoba();
        // ~Osoba();
};
class Mezczyzna : public Osoba{
};
class Kobieta : public Osoba{
};
void Osoba::wypiszWszystko(){
    cout<<"Imie: "<<imie<<endl<<"Wiek: "<<wiek<<endl;
}
string Osoba::wypiszImie(){
    return this->imie;
}
int Osoba::wypiszWiek(){
    return this->wiek;
}


