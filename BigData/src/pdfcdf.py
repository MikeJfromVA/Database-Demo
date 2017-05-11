#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 11 20:13:24 2017

@author: mikejfromva
"""

import math
import matplotlib.pyplot as plot

def uniform_pdf(x) :
    return 1 if x>=0 and x < 1 else 0

def uniform_cdf(x) :
    if x <= 0 : return 0
    elif x < 1 : return x
    else : return 1

def normal_pdf(x, mu=0, sigma=1) :
    sqrt_two_pi = math.sqrt(2 * math.pi)
    return math.exp(-((x-mu)**2)/ (2 * sigma ** 2)) / sqrt_two_pi
    
xs = [x/10 for x in range(-50, 50)]
plot.plot(xs,[normal_pdf(x) for x in xs])
plot.plot(xs,[normal_pdf(x, sigma=2) for x in xs])
plot.plot(xs,[normal_pdf(x, sigma=0.5) for x in xs])
plot.show()