#include <iostream>
#include <fstream>
#include <chrono>

int main() {
    auto start = std::chrono::high_resolution_clock::now();

    double pi = 0.0;
    for (int i = 1; i <= 10000; i++) {
        double term = 1.0 / (2 * i - 1);
        if (i % 2 == 0) {
            term = term * -1;
        }
        pi += term;
    }
    pi = pi * 4;

    std::ofstream outFile("output.txt");
    if (outFile.is_open()) {
        outFile << "Valor de Pi: " << pi << std::endl;
        outFile.close();
    } else {
        std::cerr << "Error al abrir el archivo output.txt" << std::endl;
    }

    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration = end - start;

    std::cout << "Tiempo de ejecucion: " << duration.count() << " segundos" << std::endl;
    return 0;
}
