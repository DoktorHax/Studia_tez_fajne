#include <iostream>
#include "class.h"
using namespace std;

int main(){
	Zebra zebra;
	zebra.setValue("nie znam nazw zebr", 3, "jest czarno biala czy bialo czarna?");
	zebra.displayinfo();
    
	Dolphin delfin;
    delfin.setValue("nie znam nazw delfinow", 5, "delfiny to ssaki");
	delfin.displayinfo();
	
	return 0;
}