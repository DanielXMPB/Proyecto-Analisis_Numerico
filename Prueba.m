clc;
clear;

load("datasets/operators.mat")
load("datasets/JasperRidge_norm.mat")

Z_40 = SNR(Z,30);

% Correcion de M
M = transpose(M);

% Guardar modelos
Zb = Bd(Z_40,B);
Zh = Md(Zb,M);
figure,imagesc(Zh(:,:,198));
Zm = Rd(Z_40,R);
figure,imagesc(Zm(:,:,3));
save('Model_40.mat','Zm','Zh','Z')
