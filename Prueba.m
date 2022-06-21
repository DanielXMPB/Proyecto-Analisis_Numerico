clc;
clear;

load("datasets/operators.mat")
load("datasets/JasperRidge.mat")

% Z original
%imagesc(Z(:,:,198));
% Z con 25 de ruido
Z_25 = SNR(Z,25);
figure,imagesc(Z_25(:,:,198))
% Z con 35 de ruido
Z_35 = SNR(Z,35);
%figure,imagesc(Z_35(:,:,198))

% Correcion de M
M = transpose(M);

% Guardar modelos
Zb = Bd(Z,B);
Zh = Md(Zb,M);
matfile('Zh.mat','Writable',true);
figure,imagesc(Zh(:,:,198));
Zm = Rd(Z,R);
matfile('Zm.mat','Writable',true);
figure,imagesc(Zm(:,:,3));
save('Model_35.mat','Zm','Zh','Z')
