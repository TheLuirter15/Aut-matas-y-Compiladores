#include <iostream>
#include <fstream>
#include <sstream>
#include <cctype>
#include <vector>

using namespace std;

// Función para verificar si un lexema es un número
bool esNumero(const string& lexema) {
    for (char c : lexema) {
        if (!isdigit(c)) return false;
    }
    return true;
}

// Función para verificar si un lexema es una palabra
bool esPalabra(const string& lexema) {
    for (char c : lexema) {
        if (!isalpha(c)) return false;
    }
    return true;
}

// Función para contar caracteres con y sin espacios
void contarCaracteres(const string& texto, int &conEspacios, int &sinEspacios) {
    conEspacios = texto.size();
    sinEspacios = 0;
    for (char c : texto) {
        if (!isspace(c)) sinEspacios++;
    }
}

int main() {
    ifstream archivo("entrada.txt");  // Archivo de entrada
    if (!archivo) {
        cerr << "Error al abrir el archivo." << endl;
        return 1;
    }

    string linea, textoCompleto;
    vector<string> lexemas;
    int totalNumeros = 0, totalPalabras = 0, totalCombinadas = 0;

    while (getline(archivo, linea)) {
        textoCompleto += linea + " ";  // Guarda todo el texto

        stringstream ss(linea);
        string lexema;
        while (ss >> lexema) {
            lexemas.push_back(lexema);
            if (esNumero(lexema)) {
                totalNumeros++;
            } else if (esPalabra(lexema)) {
                totalPalabras++;
            } else {
                totalCombinadas++;
            }
        }
    }

    archivo.close();

    int caracteresConEspacios, caracteresSinEspacios;
    contarCaracteres(textoCompleto, caracteresConEspacios, caracteresSinEspacios);

    // Imprimir resultados
    cout << "Total de caracteres (con espacios): " << caracteresConEspacios << endl;
    cout << "Total de caracteres (sin espacios): " << caracteresSinEspacios << endl;
    cout << "Total de lexemas: " << lexemas.size() << endl;
    cout << "Total de palabras: " << totalPalabras << endl;
    cout << "Total de numeros: " << totalNumeros << endl;
    cout << "Total de combinadas: " << totalCombinadas << endl;

    return 0;
}