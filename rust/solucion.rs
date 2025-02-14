use std::time::Instant;
use std::fs::File;
use std::io::Write;

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

    let mut file = File::create("output.txt").expect("No se pudo crear el archivo");
    write!(file, "Valor de Pi: {}\n", pi).expect("No se pudo escribir en el archivo");

    let duration = start.elapsed();

    println!("Tiempo de ejecucion: {} segundos", duration.as_secs_f64());
}
