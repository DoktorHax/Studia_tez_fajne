#include <iostream>
using namespace std;

void hanoi(int n, char from, char help, char to){
    if(n>0){
        hanoi(n-1, from, to, help);
        cout<<from<<" -> "<<to<<endl;
        hanoi(n-1, help, from, to);
    }
}

int main(){
    cout<<"1 krazek: "<<endl; hanoi(1, 'A', 'B', 'C');
    cout<<"2 krazki: "<<endl; hanoi(2, 'A', 'B', 'C');
    cout<<"3 krazki: "<<endl; hanoi(3, 'A', 'B', 'C');
    cout<<"4 krazki: "<<endl; hanoi(4, 'A', 'B', 'C');
    cout<<"5 krazkow: "<<endl; hanoi(5, 'A', 'B', 'C');
    return 0;
}