#include <iostream>
using namespace std;

double doPotegiW(double *podstawa, double *wykladnik){
    double wynik;
    wynik=*podstawa;
    for(int i=1;i<*wykladnik;i++){
        wynik*=*podstawa;
    }
        return wynik;
}
int main(){
    double a,b;
    cin>>a>>b;
    cout<<doPotegiW(&a,&b)<<endl;
    return 0;
}