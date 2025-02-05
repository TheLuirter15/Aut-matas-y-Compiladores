/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <iostream>
#include <cctype>

using namespace std;

string clasificarCadena(const string& cadena) {
    bool tieneLetras = false, tieneNumeros = false;

    for (char c : cadena) {
        if (isdigit(c))
            tieneNumeros = true;
        else if (isalpha(c))
            tieneLetras = true;

        // Si llega a tener ambos, es compuesta
        if (tieneLetras && tieneNumeros)
            return "Compuesta";
    }

    if (tieneNumeros)
        return "Número de tipo entero";
    if (tieneLetras)
        return "Palabra";

    return "Desconocido"; // Caracteres especiales
}

int main() {
    string entrada;
    cout << "Ingrese una cadena: ";
    cin >> entrada;

cout << "Clasificación: " << clasificarCadena(entrada) << endl;

return 0;
}