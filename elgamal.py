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

def param_gen(size):
    p = random_prime(2^size)
    ZZn = IntegerModRing(p)

    totient = p - 1
    a = 3
    e = totient/2
    while(pow(a, e, p) != totient):
       a = a + 2
    
    a = ZZn(a)
    return p, a

def key_gen(p, a):
    ZZn = IntegerModRing(p)
    A = ZZn.random_element()
    B = a^A

    return A, B

def sign(p, a, A):
    

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