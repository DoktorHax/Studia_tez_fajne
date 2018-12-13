#include <iostream>
using namespace std;

int sumaDoW(int *liczba){
    int wynik=*liczba;
    for(int i=(*liczba-1); i>=0; i--){
        wynik+=i;
    }
    return wynik;
}

int main(){
    int a;
    cin>>a;
    cout<<"Suma liczba od "<<a<<" wynosi: "<<sumaDoW(&a)<<endl;
    return 0;
}