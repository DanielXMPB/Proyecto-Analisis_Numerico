import scipy.io as sio 
import matplotlib.pyplot as plt 



data_path = 'Zf.mat'

data = sio.laod(data_path)


fig, axs = plt.subplots(2, 2, figsize=(10, 10))
