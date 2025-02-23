#include <iostream>
#include <vector>
#include <map>
#include <set>
#include <string>

using namespace std;

// Definición de la función de transición
map<pair<int, char>, int> delta;

// Conjunto de estados de aceptación
set<int> estados_aceptacion;

// Función que simula el AFD
bool simularAFD(int estado_inicial, const string& cadena) {
    int estado_actual = estado_inicial;
    for (char simbolo : cadena) {
        auto transicion = make_pair(estado_actual, simbolo);
        if (delta.find(transicion) != delta.end()) {
            estado_actual = delta[transicion];
        } else {
            // No hay transición definida para este símbolo
            return false;
        }
    }
    // Verificar si el estado actual es de aceptación
    return estados_aceptacion.find(estado_actual) != estados_aceptacion.end();
}

int main() {
    // Definir los estados y el alfabeto
    int num_estados;
    cout << "Ingrese el número de estados: ";
    cin >> num_estados;

    int num_simbolos;
    cout << "Ingrese el número de símbolos en el alfabeto: ";
    cin >> num_simbolos;

    vector<char> alfabeto(num_simbolos);
    cout << "Ingrese los símbolos del alfabeto: ";
    for (int i = 0; i < num_simbolos; ++i) {
        cin >> alfabeto[i];
    }

    // Definir el estado inicial
    int estado_inicial;
    cout << "Ingrese el estado inicial: ";
    cin >> estado_inicial;

    // Definir los estados de aceptación
    int num_estados_aceptacion;
    cout << "Ingrese el número de estados de aceptación: ";
    cin >> num_estados_aceptacion;

    cout << "Ingrese los estados de aceptación: ";
    for (int i = 0; i < num_estados_aceptacion; ++i) {
        int estado;
        cin >> estado;
        estados_aceptacion.insert(estado);
    }

    // Definir la función de transición
    int num_transiciones;
    cout << "Ingrese el número de transiciones: ";
    cin >> num_transiciones;

    cout << "Ingrese las transiciones en el formato 'estado_actual simbolo estado_siguiente':\n";
    for (int i = 0; i < num_transiciones; ++i) {
        int estado_actual, estado_siguiente;
        char simbolo;
        cin >> estado_actual >> simbolo >> estado_siguiente;
        delta[make_pair(estado_actual, simbolo)] = estado_siguiente;
    }

    // Leer la cadena de entrada
    string cadena;
    cout << "Ingrese la cadena a evaluar: ";
    cin >> cadena;

    // Simular el AFD
    if (simularAFD(estado_inicial, cadena)) {
        cout << "La cadena es aceptada por el AFD.\n";
    } else {
        cout << "La cadena no es aceptada por el AFD.\n";
    }

    return 0;
}
