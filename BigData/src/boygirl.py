#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 11 19:28:34 2017

@author: mikejfromva
"""

import random

def random_kid() :
    return random.choice(['boy','girl'])

both_girls = 0
either_girl = 0

for _ in range(10000) :
    older = random_kid()
    younger = random_kid()
    if older == 'girl' and younger == 'girl':
        both_girls += 1
    if older == 'girl' or younger == 'girl':
        either_girl += 1
        
# B = Both Girls
# L = At least one girl
print('P(B|L) = Prob. of both being girls given at least one is girl')
print('P(B|L) = ' + str(both_girls/either_girl))