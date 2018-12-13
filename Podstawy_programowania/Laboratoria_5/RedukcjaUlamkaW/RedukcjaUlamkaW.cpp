#include <iostream>
using namespace std;

int NWD(int n, int g){
if (g!=0) return NWD(g, n%g);
return n;
}

void redukcjaUlamkaW(int *n, int *g){
    int x=*n, y=*g;
    *n/=NWD(x, y);
    *g/=NWD(x, y);
}

int main(){
    int a,b;
    cin>>a>>b;
    redukcjaUlamkaW(&a, &b);
    cout<<a<<"/"<<b;
    return 0;
}