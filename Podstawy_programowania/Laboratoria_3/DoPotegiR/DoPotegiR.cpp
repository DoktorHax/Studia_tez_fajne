#include <iostream>
using namespace std;

double doPotegi(double podstawa, double wykladnik){
    if(wykladnik==0){
        return 1;
    }
    else{
        return podstawa*doPotegi(podstawa,wykladnik-1);
    }
}

int main(){
    double a,b;
    cin>>a;
    cin>>b;
    cout<<doPotegi(a,b)<<endl;
    return 0;
}