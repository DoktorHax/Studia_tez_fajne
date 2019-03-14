#include <iostream>
using namespace std;

class Prostokat;
class Punkt{
  string nazwa;
  float x, y;
public:
  void podajWsp(){
      cout<<"Podaj x: ";
      cin>>x;
      cout<<" Podaj y: ";
      cin>>y;
  }
  void wczytaj();
  friend void sedzia(Punkt &pkt, Prostokat &pst);
};
class Prostokat: public Punkt{
  string nazwa;
  float x, y, szerokosc, wysokosc;
public:
  void podajPol(){
      cout<<"Podaj pierwsza wsp miejsca osadzenia prosektora: ";
      cin>>x;
      cout<<"Podaj droga wsp miejsca osadzenia prosektora: ";
      cin>>y;
      cout<<"Podaj szerokosc: ";
      cin>>szerokosc;
      cout<<"Podaj wysokosc: ";
      cin>>wysokosc;
  }
  void wczytaj();
  friend void sedzia(Punkt &pkt, Prostokat &pst);
};
void Punkt::wczytaj(){
  cout<<endl<<"Nazwa obiektu: "<<nazwa;
}
void Prostokat::wczytaj()
{
  cout<<endl<<"Nazwa obiektu: "<<nazwa;
}
void sedzia(Punkt &pkt, Prostokat &pst) {
  if ((pkt.x>=pst.x) && (pkt.x<=pst.x+pst.szerokosc) && (pkt.y>=pst.y) && (pkt.y<=pst.y+pst.wysokosc))
  cout<<endl<<"Punkt "<<pkt.nazwa<<" nalezy do prostokata: "<<pst.nazwa;
  else
  cout<<endl<<"Punkt "<<pkt.nazwa<<" lezy poza prostokatem: "<<pst.nazwa;
}