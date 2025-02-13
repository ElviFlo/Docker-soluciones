start_time = new Date().getTime();

let pi = 0.0;

for (let i = 1; i <= 10000; i++) {
    let term = 1.0 / (2 * i - 1);
    
    if (i % 2 === 0) {
        term *= -1;
    }
    
    pi += term;
}

pi *= 4;

end_time = new Date().getTime();
console.log("pi =", pi);
console.log("Tiempo de ejecución:" , (end_time - start_time) / 1000, "segundos")
