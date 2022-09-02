clc;
clear;
load("datasets/operators.mat")
load("datasets/Model_norm.mat")
load("Estimacion_E.mat")
% load("datasets/gt.mat")

% Correcion M
M = transpose(M);
ops.niter=15;
ops.n=10;
ops.rho = 0.99;

% [A] = abundances_step(A,E,Zh,Zm,B,M,R,ops);
% A=reshape(A.',100,100,4);
% imagesc(A(:,:,1));
% figure,imagesc(A(:,:,2));
% figure,imagesc(A(:,:,3));
% figure,imagesc(A(:,:,4));

%[E] = endmembers_step(A,E,Zh,Zm,B,M,R,ops);
%imagesc(E(:,:));

% [Zf, AZf, EZf] = spectral_fusion(E, Zh, Zm, B, M, R, ops);
% Zf = reshape(Zf.',100,100,198);
% imagesc(Zf(:,:,1));
% save('Zf.mat','Zf','AZf',"EZf"); 
% Max = max(Zf,[],'all');
% Min = min(Zf,[],'all');

% rho = [1.5;1;0.5];
rho = [ 0.99 ];
m = zeros(size(rho,1),5);
endm = zeros(10000,1);
m = [rho m];
for i=1:size(rho,1)
    ops.rho = m(i,1);
    Zf = spectral_fusion(E, Zh, Zm, B, M, R, ops);
    Zf = reshape(Zf.',100,100,198);
    m(i,2) = psnr(Zf,Z);
    m(i,3) = ssim(Zf,Z);
    cont = 1;
    Zfsam = reshape(Zf,10000,198);
    Zsam = reshape(Z,10000,198);
    for j=1:size(Zfsam,1)
        endm(j,1) = sam(Zfsam(j,:),Zsam(j,:));
    end
    m(i,4) = mean(endm);
    m(i,5) = max(Zf,[],'all');
    m(i,6) = min(Zf,[],'all');
end
% save("Metricas_1.1-0.02.mat","m")