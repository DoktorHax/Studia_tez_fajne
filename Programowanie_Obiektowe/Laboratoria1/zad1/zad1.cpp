#include <iostream>
using namespace std;
class shape {
	public:
	int x;
    int y;
	virtual void area();
};

class Triangle:public shape {
		void area(int x,int y) {
			int wynik=(x*y)/2;
		}
	};
	
class Rectangle:public shape{
		void area(int x,int y){
			int wynik2=x*y;
		}
	};

int main()
{
    int x, y;
	cout<<"Podaj wymiary prostokata: ";
    cin>>x;
    cin>>y;
	Triangle trojkat;
    cout<<trojkat.area(x,y);
    Rectangle prostokat;
	cout<<prostokat.area(x,y);
	return 0;
}