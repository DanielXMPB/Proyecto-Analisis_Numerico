clc;
clear;

load("datasets/operators.mat")
load("datasets/JasperRidge.mat")

Z_25 = SNR(Z,25);
Z_35 = SNR(Z,35);

% Correcion de M
M = transpose(M);

% Guardar modelos
Zb = Bd(Z,B);
Zh = Md(Zb,M);
figure,imagesc(Zh(:,:,198));
Zm = Rd(Z,R);
figure,imagesc(Zm(:,:,3));
save('Model.mat','Zm','Zh','Z')
