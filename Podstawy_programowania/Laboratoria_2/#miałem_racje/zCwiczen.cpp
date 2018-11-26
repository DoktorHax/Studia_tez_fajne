#include <iostream>
using namespace std;
int r1, m1, d1, r2, m2, d2;

int main(){
    cin>>r1;
    cin>>m1;
    cin>>d1;
    cin>>r2;
    cin>>m2;
    cin>>d2;

    if((r1<r2)||((r1=r2)&&(m1<m2))||((r1=r2)&&(m1=m2)&&(d1<d2))){
        cout<<"data pierwsza jest wczesniejsza"<<endl;
    }
    else{
        cout<<"data 2 jest wczesniejsza"<<endl;
    }
    return 0;
}