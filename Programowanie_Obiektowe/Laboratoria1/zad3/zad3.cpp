#include <iostream>
using namespace std;
string name;
int age;
string info;

class Animal
{
	protected:
		string name;
		int age;
        string info;
	public:	
		void setValue(string name,int age,string info);
		void displayinfo();
};
class zebra:public Animal{
};
	void Animal::setValue(string name,int age,string info)
	{
		this->name=name;
		this->age=age;
	}
		void Animal::displayinfo()
	{
		cout <<"name: "<<name<<endl<<"age: "<<age<<endl;
	}
	
int main()
{
	Animal zebra;
	zebra.setValue("Franek", 18);
	zebra.displayinfo();
    Animal delfin;
    delfin.setValue("Franek", 18);
	delfin.displayinfo();
	return 0;
}