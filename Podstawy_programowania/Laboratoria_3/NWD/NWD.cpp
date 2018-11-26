#include <iostream>
using namespace std;

int NWD1(int n, int g){
    while(n!=g){
        if(n<g){
            g-=n;
        }
        else{
            n-=g;
        }
    }
    return n;
}

int NWD2(int n, int g){
    int t(0);
    while(g!=0){
        t=g;
        g=n%g;
        n=t;
    }
    return n;
}

int NWD3(int n, int g){
    if (n==g) return n;
    else if (n>g) return NWD3(n-g, g);
    else return NWD3(n, g-n);
}

int NWD4(int n, int g){
    if (g!=0) return NWD4(g, n%g);
    return n;
}

int main(){
    unsigned int a,b;
    cin>>a>>b;
    cout<<"NWD1: "<<NWD1 (a,b)<<endl;
    cout<<"NWD2: "<<NWD2 (a,b)<<endl;
    cout<<"NWD3: "<<NWD3 (a,b)<<endl;
    cout<<"NWD4: "<<NWD4 (a,b)<<endl;
    return 0;
}