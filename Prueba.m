clc;
clear;

load("datasets/operators.mat")
load("datasets/JasperRidge.mat")
imagesc(Z(:,:,198));
M = transpose(M);
Zb = Bd(Z,B);
Zh = Md(Zb,M);
matfile('Zh.mat','Writable',true);
figure,imagesc(Zh(:,:,198));
Zm = Rd(Z,R);
matfile('Zm.mat','Writable',true);
figure,imagesc(Zm(:,:,3));
save('Model.mat','Zm','Zh','Z')