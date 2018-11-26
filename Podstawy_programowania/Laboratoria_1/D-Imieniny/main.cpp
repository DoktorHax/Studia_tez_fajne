#include <iostream>
using namespace std;
int C, L, dzieci, iloraz, iloczyn, zostalo;

int main()
{
    cout<<"Podaj liczbe cukierkow: ";
    cin>>C;
    cout<<"Podaj liczbe osob w klasie:  ";
    cin>>L;

    dzieci=L-1;
    iloraz=C/dzieci;
    iloczyn=iloraz*dzieci;
    zostalo=C-iloczyn;

    cout<<"dzieci w klasie bez Jasia: "<<dzieci<<endl;
    cout<<"Kazdy dostal: "<<iloraz<<endl;
    cout<<"Jasiowi zostalo: "<<zostalo;


    return 0;
}
