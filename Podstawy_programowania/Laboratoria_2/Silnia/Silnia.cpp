#include <iostream>
using namespace std;

int silnia (int liczba){
    int sil;
    if (liczba<0) return 0;
    if (liczba==0||liczba==1) return 1;
    sil=liczba*silnia(liczba-1);
    return sil;
}
int main(){
    int a;
    cout<<"Podaj liczbe: ";
    cin>>a;
    a=silnia(a);
    cout<<"Wartosc a: "<<a<<endl;
    return 0;
}
