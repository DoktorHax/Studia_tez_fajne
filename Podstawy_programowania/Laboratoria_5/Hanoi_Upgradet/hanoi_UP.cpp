#include <iostream>
using namespace std;

void hanoi(int n, char from, char help, char to){
    if(n>0){
        hanoi(n-1, from, to, help);
        cout<<from<<" -> "<<to<<endl;
        hanoi(n-1, help, from, to);
    }
}
double doPotegi(double x, double y){
    double wynik;
    wynik=x;
    for(int i=1;i<y;i++){
        wynik*=x;
    }
        return wynik;
}

int main(){
    int i,c;
    cout<<"podaj liczbe krazkow ";
    cin>>i;
    cout<<"Ilosc podanych krazkow: "<<i<<endl; hanoi(i, 'A', 'B', 'C');
    c=doPotegi(2, i)-1;
    cout<<"Liczba przestawien: "<<c<<endl;
    return 0;
}