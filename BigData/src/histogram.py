#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Apr  4 14:29:31 2017

@author: mikejfromva
"""

import random
from matplotlib import pyplot as plot

# 101 dice rolls
dicerolls = [random.randint(1,6) + random.randint(1,6) 
    for x in range(10000)]
                
plot.hist(dicerolls, bins=[x+0.5 for x in range(13)])
plot.grid(True)