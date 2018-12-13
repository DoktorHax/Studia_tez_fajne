#include <iostream>
using namespace std;

void hanoi2(int n, char from, char to, char help){
    if(n>0){
        hanoi2(n-1, from, help, to);
        cout<<from<<" -> "<<to<<endl;
        hanoi2(n-1, help, to, from);
    }
}

int main(){
    int i,c;
    cout<<"podaj liczbe krazkow ";
    cin>>i;
    cout<<"Ilosc podanych krazkow: "<<i<<endl; hanoi2(i, 'A', 'B', 'C');
    return 0;
}