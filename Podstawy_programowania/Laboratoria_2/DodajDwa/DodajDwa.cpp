#include <iostream>
using namespace std;
int dodajDwa (int liczbaWejsciowa){
    int wartosc;
    wartosc=liczbaWejsciowa+2;
    return wartosc;
}

int main(){
    int a;
    cout<<"Podaj liczbe: ";
    cin>>a;
    a=dodajDwa(a);
    cout<<"Wartosc a: "<<a<<endl;
    return 0;
}
