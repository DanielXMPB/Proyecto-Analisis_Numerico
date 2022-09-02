from spec2rgb import COLOR_SPACE


import matplotlib.pyplot as plt 
import scipy.io as sio
from spec2rgb import ColourSystem
import numpy as np

data_path = 'Zf_E.mat'
var_name = 'Zf'
img_spec = sio.loadmat(data_path)[var_name]

color_space = "sRGB"
start, end = 380, 2500 # VariSpec VIS
number_bands = img_spec.shape[-1]

img_spec -= np.min(img_spec)
img_spec /= np.max(img_spec)

cs = ColourSystem(cs=color_space, start=start, end=end, num=number_bands)
img_rgb = cs.spec_to_rgb(img_spec)

plt.imshow(img_rgb / np.max(img_rgb))
plt.show()