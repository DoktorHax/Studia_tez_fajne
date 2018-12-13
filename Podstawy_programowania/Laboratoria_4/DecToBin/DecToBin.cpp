#include <iostream>
using namespace std;
int d;

void decToBin(int liczba){
    int i(0), j, tablica[30];
    while(liczba!=0){
        tablica[i++]=liczba%2;
        liczba/=2;
    }
    for(j=i-1;j>=0;j--){
        cout<<tablica[j];
    }
}

int main(){
    cout<<"Podaj liczbe: ";
    cin>>d;
    cout<<"Postac liczby: "<<d<<" w systemie binarnym "<<endl;
    decToBin(d);
    return 0;
}