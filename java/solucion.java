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
        
        long endTime = System.nanoTime();
        double executionTime = (endTime - startTime) / 1e9;
        
        System.out.println("pi = " + pi);
        System.out.println("Tiempo de ejecución: " + executionTime + " segundos");
    }
}
