#include <iostream>
using namespace std;
int liczba;

void decToBinBit(int liczba){
    int i=31;
    bool ok=false;
    while(i--){
        if (liczba>>i&1&!ok) ok=true;
        if (ok) cout<<((liczba>>i)&1);
    }
}

int main(){
    cout<<"Podaj liczbe: ";
    cin>>liczba;
    cout<<liczba<<" po zamianie na postac binarna: ";
    decToBinBit(liczba);
    cout<<endl;
    return 0;
}