#include <iostream>
using namespace std;
int main() {
    int arr[5];
    for (int i = 0; i < 5; i++) {
    arr[i] = i * 2;
}

    for (int i = 0; i < 5; i++) {
    cout << arr[i] << endl;
}

    int mat[2][3];
    for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
    mat[i][j] = i + j;
}

}

    for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
    cout << mat[i][j] << endl;
}

}

}


