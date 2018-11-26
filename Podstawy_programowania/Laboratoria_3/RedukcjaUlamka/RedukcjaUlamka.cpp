#include <iostream>
using namespace std;

int NWD(int n, int g){
    if (g!=0) return NWD(g, n%g);
    return n;
}

void RedukcjaUlamka(int licznik, int mianownik){
    licznik=licznik/NWD(licznik,mianownik);
    mianownik=mianownik/NWD(licznik,mianownik);
    cout<<licznik<<endl<<mianownik<<endl;
}    

int main(){
    int a,b;
    cin>>a>>b;
    RedukcjaUlamka(a,b);
    cout<<"NWD: "<<NWD (a,b)<<endl;
    return 0;
}