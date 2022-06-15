clc;
clear;

load("operators.mat")
load("JasperRidge.mat")
Zm = Md(Z,M);
matfile('Zm.mat','Writable',true);
imagesc(Zm(:,:,198));
Zr = Rd(Z,R);
matfile('Zr.mat','Writable',true);
figure,imagesc(Zr(:,:,3));
Zb = Bd(Z,B);
matfile('Zb.mat','Writable',true);
save('Model.mat','Zb','Zm','Zr')
figure,imagesc((Zb(:,:,198)));