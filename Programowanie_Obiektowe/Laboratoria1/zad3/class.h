#include <iostream>
using namespace std;

class Animal{
	protected:
		string name;
		int age;
        string info;
	public:	
		void setValue(string name, int age, string info);
		void displayinfo();
};

class Zebra:public Animal{
};
class Dolphin:public Animal{
};

void Animal::setValue(string name, int age, string info){
	this->name=name;
	this->age=age;
	this->info=info;
}
void Animal::displayinfo(){
	cout<<"name: "<<name<<endl;
	cout<<"age: "<<age<<endl;
	cout<<"info: "<<info<<endl<<endl;
}