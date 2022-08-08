clc;
clear;
load("datasets\operators.mat")
load("datasets\Model_35.mat")

%Correcion M
M = transpose(M);
% Estimacion de A y E
E=zeros(198,4);
A=zeros(4,10000);
ops.rho=0.1;
ops.niter=10;
[A]=abundances_step(A,E,Zh,Zm,B,M,R,ops);
A=reshape(A.',100,100,4);
imagesc(A(:,:,1));