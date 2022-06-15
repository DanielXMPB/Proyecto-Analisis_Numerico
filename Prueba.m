clc;
clear;

load("operators.mat")
load("JasperRidge.mat")
Zm = Md(Z,M);
matfile('Zm.mat','Writable',true);
save('Zm.mat','Zm')
imagesc(Zm(:,:,198));
Zr = Rd(Z,R);
matfile('Zr.mat','Writable',true);
save('Zr.mat','Zr')
figure,imagesc(Zr(:,:,3));
Zb = Bd(Z,B);
matfile('Zb.mat','Writable',true);
save('Zb.mat','Zb')
figure,imagesc(abs(fftshift(Zb(:,:,198))));
