#include <iostream>
#include <fstream>
#include <string>
using namespace std;

string napis;

int main(){





    fstream plik;
    plik.open("test.txt", ios::out | ios::trunc);
    if(plik.good()==true){
        int n;
        int x;
        cout<<"podaj n: ";
        cin>>n;
        for(int y=2; n>=y; y++){
            x=0;
            for(int z=2; z<y; z++){
                if(!(y%z)){
                    x=2;
                    break;
                }
            }
            if(!x){
                plik<<y<<endl;
            }
        }
        plik.close();
    }
    else cout<<"Brak dostepu do pliku"<<endl;
    plik.open("test.txt", ios::in);
    if(plik.good()==true){
        while(!plik.eof()){
            getline(plik, napis);
            cout<<napis<<endl;
        }
        plik.close();
    }
    else cout<<"Brak dostępu do pliku"<<endl;
    return 0;
}