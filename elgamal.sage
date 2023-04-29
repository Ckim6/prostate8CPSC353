'''
Assignment Name: Project 8
Name 1: Brennan Longstreth
Name 2: Caden Kim
Name 3: Riley Sikes
GitHub Name: BrennanLongstreth
'''

################################################################################
# Assignment: El Gamal Signature Scheme
# Date: 4/28/23
# Desc: Develop an El Gamal Signature Scheme
################################################################################

import string
import secrets

'''
Pre: size is an exponent, as in 2^size.
Post: program returns El Gamal parameters, large prime, p and primitive root, a mod p as defined in class and in McAndrew
'''
def param_gen(size):
  p = random_prime(2^size)
  a = mod(primitive_root(p), p)

  return p, a

'''
Pre: p and a are returned by param_gen
Post: returns private key, A, and public key, B as defined in class and in McAndrew
'''
def key_gen(p, a):
  A = randint(1, p)
  B = a^A

  return A, B

'''
Pre: p and a are the returned by parem_gen. A is your private key
Post: returns r and S as defined in class and in McAndrew
'''
def sign(m, p, a, A):
  while True:
    k = int(secrets.randbelow(int(p)))+2
    if gcd(p-1,k) == 1: # random between 2 and p -2 and relatively prime to p-1
      break
  # print("k:",k)
  r = int(mod(a^k, p))
  print("r:",r)
  S = mod((m - A * r) * inverse_mod(k,p-1), p-1)
  
  return S

#transforms msg_in to a base 256 integer which it then returns
def txt_to_num(msg_in):
  msg_idx = list(map(ord,msg_in))
  num = ZZ(msg_idx,256)
  return num 

#transforms a base 256 integer to a string which it then returns
def num_to_txt(num_in):
  msg_idx = num_in.digits(256)
  m = map(chr,msg_idx)
  m = ''.join(m)
  return m

if __name__ == "__main__":
  size=100
  message="Mashed"
  p,a = param_gen(size)
  # p = 983742435220503122220524208407
  # a = 5
  print("p:", p)
  print("a:", a)
  A,B = key_gen(p,a)
  # A = 51
  # B = 52
  # print("A:",A) #private key
  # print("B:",B) #public key
  print("m:",txt_to_num(message))
  S = sign(txt_to_num(message),p,a,A)
  print("S:",S)

