def fib(n):
    """Return nth fibonacci number"""
    a, b = 1, 1
    while n > 0:
        a, b = b, a + b
        n -= 1
    return a

from dis import dis
dis(fib)

print(fib(10))
