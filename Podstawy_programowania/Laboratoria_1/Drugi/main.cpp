#include <iostream>
using namespace std;
float pierwsza, druga, suma, roznica, iloczyn, iloraz;

int main()
{
    cout<<"Podaj pierwsza liczbe 1-10: ";
    cin>>pierwsza;

    cout<<"Podaj druga liczbe 1-10: ";
    cin>>druga;

    suma=pierwsza+druga;
    roznica=pierwsza-druga;
    iloczyn=pierwsza*druga;
    iloraz=pierwsza/druga;
    cout<<"Suma: "<<suma<<endl;
    cout<<"Roznica: "<<roznica<<endl;
    cout<<"Iloczyn: "<<iloczyn<<endl;
    cout<<"Iloraz: "<<iloraz;
    return 0;
}
