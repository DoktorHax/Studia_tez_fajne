#include <iostream>
using namespace std;
int d;

void decToBinR(int liczba){
    if(liczba>0){
        decToBinR(liczba/2);
        cout<<liczba%2;
    }
}

int main(){
    cout<<"Podaj liczbe: ";
    cin>>d;
    cout<<"Postac liczby: "<<d<<" w systemie binarnym "<<endl;
    decToBinR(d);
    return 0;
}