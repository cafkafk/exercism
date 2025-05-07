def is_armstrong_number(number):
    if number == 0:
        return True
    pow = len(list(str(number)))
    res = 0
    for n in list(str(number)):
        res += int(n) ** pow
    return number == res


if __name__ == "__main__":
    for i in range(0, 200):
        is_armstrong_number(10)
