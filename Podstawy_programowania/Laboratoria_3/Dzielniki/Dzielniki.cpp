#include <iostream>
using namespace std;

void Dzielniki(int liczba){
    for(int b=1; b<=liczba; b++){
        if(liczba%b==0){
            cout<<b<<" ";
        }
    }
}    

int main(){
    int a;
    cin>>a;
    Dzielniki(a);
    return 0;
}