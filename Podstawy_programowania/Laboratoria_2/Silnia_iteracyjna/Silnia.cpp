#include <iostream>
using namespace std;

double doPotegi(double podstawa, double wykladnik){
    double wynik;
    wynik=podstawa;
    for(int i=1;i<wykladnik;i++)
        wynik*=podstawa;

        return wynik;
}
int main(){
    double a,b;
    cin>>a;
    cin>>b;
    cout<<doPotegi(a,b)<<endl;
    return 0;
}