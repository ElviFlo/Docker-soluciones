#include <iostream>
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

    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration = end - start;

    std::cout << "pi = " << pi << std::endl;
    std::cout << "Tiempo de ejecución: " << duration.count() << " segundos" << std::endl;
    
    return 0;
}
