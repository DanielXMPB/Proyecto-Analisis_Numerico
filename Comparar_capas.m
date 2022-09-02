load('datasets\JasperRidge.mat')
load('Estimacion_E.mat')
load('Zf.mat')

n = 198;
imagesc(Zf(:,:,n))
figure,imagesc(Z(:,:,n))