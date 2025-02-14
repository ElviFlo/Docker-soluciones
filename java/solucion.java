import java.io.FileWriter;
import java.io.IOException;

public class solucion {
    public static void main(String[] args) {
        long startTime = System.nanoTime();

        double pi = 0;
        double term;

        for (int i = 1; i <= 10000; i++) {
            term = 1.0 / (2 * i - 1);

            if (i % 2 == 0) {
                term *= -1;
            }

            pi += term;
        }

        pi *= 4;

        try (FileWriter writer = new FileWriter("output.txt")) {
            writer.write("Valor de Pi: " + pi + "\n");
        } catch (IOException e) {
            System.err.println("Error al escribir en el archivo: " + e.getMessage());
        }

        long endTime = System.nanoTime();
        double executionTime = (endTime - startTime) / 1e9;

        System.out.println("Tiempo de ejecucion: " + executionTime + " segundos");
    }
}
