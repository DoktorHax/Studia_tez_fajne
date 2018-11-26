#include <iostream>
using namespace std;

double kwadrat(int liczba){
    int wynik;
    wynik=liczba*liczba;
    return wynik;
}
int main(){
    int a;
    cin>>a;
    a=kwadrat(a);
    cout<<a;
    return 0;
}