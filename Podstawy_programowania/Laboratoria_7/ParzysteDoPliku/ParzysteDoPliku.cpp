#include <iostream>
#include <fstream>
#include <string>
using namespace std;

string napis;

int main(){
    

    fstream plik;
    plik.open("test.txt", ios::out | ios::trunc);
    if(plik.good()==true){
        for(int x=0; x<=100; x+=2){
        plik<<x<<endl;
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