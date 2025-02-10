console.time("Execution Time");

let pi = 0.0;

for (let i = 1; i <= 10000; i++) {
    let term = 1.0 / (2 * i - 1);
    
    if (i % 2 === 0) {
        term *= -1;
    }
    
    pi += term;
}

pi *= 4;

console.timeEnd("Execution Time");
console.log("pi =", pi);
