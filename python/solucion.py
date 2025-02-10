import time

start_time = time.time()

pi = 0
for i in range(1, 10001):
    term = 1 / (2 * i - 1)
    if i % 2 == 0:
        term *= -1
    pi += term

pi *= 4

end_time = time.time()
execution_time = end_time - start_time

print(f"pi =  {pi}")
print(f"Tiempo de ejecución: {execution_time:.6f} segundos")
