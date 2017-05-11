# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import numpy as numpy
import matplotlib.pyplot as plot

x = numpy.arange(-10, 10, 0.01)

def sigmoid(x):
        return 1/(1+numpy.exp(-x))


#plot.plot(x, nonlinear(x))

plot.plot(x, sigmoid(x))
plot.title('Sigmoid')
plot.grid(True)
plot.show()