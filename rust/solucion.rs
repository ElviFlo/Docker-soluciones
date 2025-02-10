use std::time::Instant;

fn main() {
    let start = Instant::now();

    let mut pi: f64 = 0.0;
    
    for i in 1..=10000 {
        let mut term = 1.0 / (2 * i - 1) as f64;
        
        if i % 2 == 0 {
            term *= -1.0;
        }
        
        pi += term;
    }
    
    pi *= 4.0;
    
    let duration = start.elapsed();
    
    println!("pi = ", pi);
    println!("Tiempo de ejecución: segundos", duration.as_secs_f64());
}
