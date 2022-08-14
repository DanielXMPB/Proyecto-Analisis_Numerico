clc;
clear;
load("datasets\operators.mat")
load("datasets\Model_35.mat")

%Correcion M
M = transpose(M);
ops.rho=0.01;
ops.niter=4;
ops.n=5;

% A = randn(4,10000);
% a = 0;
% b = 1;
% E = (b-a).*rand(198,4) + a;
% 
% [A] = abundances_step(A,E,Zh,Zm,B,M,R,ops);
% A=reshape(A.',100,100,4);
% imagesc(A(:,:,1));
% figure,imagesc(A(:,:,2));
% figure,imagesc(A(:,:,3));
% figure,imagesc(A(:,:,4));

% [E] = endmembers_step(A,E,Zh,Zm,B,M,R,ops);
% imagesc(E(:,:));

Zf = spectral_fusion(Zh, Zm, B, M, R, ops);
Zf = reshape(Zf.',100,100,198);
imagesc(Zf(:,:,1));
%save('Zf.mat','Zf');