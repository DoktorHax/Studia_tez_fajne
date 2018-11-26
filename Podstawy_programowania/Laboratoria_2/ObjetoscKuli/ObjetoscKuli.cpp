#include <iostream>
#include <math.h>
using namespace std;

double objetoscKuli(double promien){
    double wynik;
    wynik=(4*3.14*pow(promien,3))/3; //zamiast 3.14 powinno być M_PI
    return wynik;
}

int main(){
    double a;
    cin>>a;
    a=objetoscKuli(a);
    cout<<a<<endl;
}