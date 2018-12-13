#include <iostream>
using namespace std;
int d;

void decToHex(int liczba){
    if(liczba>0){
        decToHex(liczba/16);
        switch(liczba%16){
            case 10: cout<<"A"; break;
            case 11: cout<<"B"; break;
            case 12: cout<<"C"; break;
            case 13: cout<<"D"; break;
            case 14: cout<<"E"; break;
            case 15: cout<<"F"; break;

            default: cout<<liczba%16;
        }
    }
}

int main(){
    cout<<"Podaj liczbe: "<<endl;
    cin>>d;
    cout<<"Postac liczby: "<<d<<" w systemie hexadecymalnym "<<endl;
    decToHex(d);
    return 0;
}