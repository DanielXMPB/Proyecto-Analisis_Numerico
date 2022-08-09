clc;
clear;
load("datasets\operators.mat")
load("datasets\Model_35.mat")
load("Estimaciones.mat")

%Correcion M
M = transpose(M);
ops.rho=0.01;
ops.niter=8;
ops.n=2;
%[A] = abundances_step(A,E,Zh,Zm,B,M,R,ops);
%A=reshape(A.',100,100,4);
%imagesc(A(:,:,4));

%[E] = endmembers_step(A,E,Zh,Zm,B,M,R,ops);
%imagesc(E(:,:));
Zf = spectral_fusion(Zh, Zm, B, M, R, ops);
Zf = reshape(Zf.',100,100,198);
imagesc(Zf(:,:,198));