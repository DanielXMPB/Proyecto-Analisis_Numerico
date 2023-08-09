clc;
clear;
load("datasets/operators.mat")
load("datasets/Model_40.mat")
load("Estimacion_E.mat")
% load("datasets/gt.mat")

% Correcion M
M = transpose(M);
ops.niter=20;
ops.n=20;
ops.rho = 1;

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
% AZf = reshape(AZf', [100 100 4]);
% imagesc(Zf(:,:,1));
% save('Zf_imagen.mat','Zf','AZf',"EZf"); 
% Max = max(Zf,[],'all');
% Min = min(Zf,[],'all');

rho = 1;
m = zeros(size(rho,1),5);
endm = zeros(10000,1);
m = [rho m];
for i=1:size(rho,1)
    ops.rho = m(i,1);
    [Zf, AZf, EZf] = spectral_fusion(E, Zh, Zm, B, M, R, ops);
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
% AZf = reshape(AZf', [100 100 4]);
% save('Zf_30.mat','Zf','AZf',"EZf"); 
% save("Metricas_Zf_30.mat","m")