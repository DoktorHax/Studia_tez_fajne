#include <iostream>
using namespace std;
int d, s;

void decTo(int liczba, int system){
    if(liczba>0){
        decTo(liczba/system, system);
        cout<<liczba%2;
    }
}

int main(){
    cout<<"Podaj liczbe: ";
    cin>>d;
    cout<<"Podaj system: ";
    cin>>s;
    cout<<"Postac liczby: "<<d<<" w systemie "<<s<<endl;
    decTo(d,s);
    return 0;
}