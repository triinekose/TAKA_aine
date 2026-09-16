#!/usr/bin/env python3
"""
generate_data.py

Genereerib 200 juhuslikku täisarvu vahemikus 1 kuni 100 (kaasa arvatud)
ja väljastab need standardväljundisse (stdout), üks arv rea kohta.

Kasutus:
    python3 generate_data.py > data/data1.txt
"""

import random

def generate_numbers(count=200, low=1, high=100):
    """Genereerib `count` juhuslikku täisarvu vahemikus [low, high]."""
    return [random.randint(low, high) for _ in range(count)]


def main():
    numbers = generate_numbers()
    for number in numbers:
        print(number)


if __name__ == "__main__":
    main()

