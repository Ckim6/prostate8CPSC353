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
def sign(p, a, A):
  
  S = 
  r = mod(a^k, p)
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
  