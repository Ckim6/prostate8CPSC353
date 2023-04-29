'''
Assignment Name: Project 8
Name 1: Brennan Longstreth
Name 2: Caden Kim
Name 3: Riley Sikes
GitHub Name: BrennanLongstreth
'''

################################################################################
# Assignment: Diffie Hellman
# Date: 4/28/23
# Desc: Digital signature scheme
################################################################################

import random

'''
Generates the params for the rest of the program
Parameters:
    size (int): 2^size is the max for the primes
Returns:
    p (int): large prime
    g (int): primitive root of p
'''
def param_gen(size):
    p = 0
    g = 0

    # get the primes in the range
    primes = prime_range(0, 2**size)

    # set the chosen prime to the largest one in the range
    p = primes[len(primes) - 1]
    g = primitive_root(p)

    return p, g

'''
Generates Alice's params A, a
Parameters:
    p (int): large prime
    g (int): primitive root of p
Returns:
    A (int): public A
    a (int): private a
'''
def Alice(p, g):
    A = 0
    a = 0

    a = random.randrange(0, p)
    A = power_mod(g, a, p)

    return A, a

'''
Generates Bob's params B, b
Parameters:
    p (int): large prime
    g (int): primitive root of p
Returns:
    B (int): public B
    b (int): private b
'''
def Bob(p, g):
    B = 0
    b = 0

    b = random.randrange(0, p)
    B = power_mod(g, b, p)

    return B, b

'''
Check Alice's message
Parameters:
    p (int): large prime
    a (int): private a
    B (int): public B
Returns:
    kAlice (int): Alice's digital signature check
'''
def Alice_Key(p, a, B):
    kAlice = 0

    kAlice = power_mod(B, a, p)

    return kAlice

'''
Check Bob's message
Parameters:
    p (int): large prime
    b (int): private b
    A (int): public A
Returns:
    KBob (int): Bob's digital signature check
'''
def Bob_Key(p, b, A):
    kBob = 0

    kBob = power_mod(A, b, p)

    return kBob


if __name__ == "__main__":
    p,g = param_gen(10)

    A, a = Alice(p, g)

    B, b = Bob(p, g)

    kAlice = Alice_Key(p, a, B)

    kBob = Bob_Key(p, b, A)

    print("k_alice:", kAlice, "k_bob:", kBob)