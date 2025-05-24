#include <iostream>
using namespace std;
int main() {
    cout << "Hello, Java!" << endl;
    int x = 5;
    char c = 'A';
    float f = 3.14f;
    double d = 2.718;
    x = x * x + 1;
    double y = x * d;
    if (x > 0 && y < 10) {
    x = x - 1;
    }
else     if (x == 0) {
    x = 0;
    }
else {
    x = x + 1;
    }
    cout << x << endl;
    cout << c << endl;
    cout << f << endl;
    cout << d << endl;
    cout << x + y << endl;
    return 0;
}