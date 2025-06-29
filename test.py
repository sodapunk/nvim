def foo(i: int):
    return 2 * i


def bar(j: int):
    k = foo(j)
    return k / 2


def add(a: int, b: int):
    return a + b


x = add(1, 2)
