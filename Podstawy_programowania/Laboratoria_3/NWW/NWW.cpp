#include <iostream>
using namespace std;

int NWD(int n, int g){
    if (g!=0) return NWD(g, n%g);
    return n;
}
int NWW(int n, int g){
    return n*g/NWD(g,n);
}

int main(){
    unsigned int a,b;
    cin>>a>>b;
    cout<<"NWD: "<<NWD (a,b)<<endl;
    cout<<"NWW: "<<NWW (a,b)<<endl;
    return 0;
}