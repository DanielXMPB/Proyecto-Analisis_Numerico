clc;
clear;
load("datasets/operators.mat")
load("datasets/Model.mat")
load("Estimacion_E.mat")
% load("datasets/gt.mat")

% Correcion M
M = transpose(M);
ops.niter=20;
ops.n=10;
ops.rho=0.57;

% [A] = abundances_step(A,E,Zh,Zm,B,M,R,ops);
% A=reshape(A.',100,100,4);
% imagesc(A(:,:,1));
% figure,imagesc(A(:,:,2));
% figure,imagesc(A(:,:,3));
% figure,imagesc(A(:,:,4));

%[E] = endmembers_step(A,E,Zh,Zm,B,M,R,ops);
%imagesc(E(:,:));

Zf = spectral_fusion(E, Zh, Zm, B, M, R, ops);
Zf = reshape(Zf.',100,100,198);
imagesc(Zf(:,:,1));
save('Zf.mat','Zf');
% figure, imagesc(Z(:,:,1));

% rho = [0.57;0.55;0.53];
% m = zeros(size(rho,1),3);
% endm = zeros(10000,1);
% m = [rho m];
% for i=1:size(rho,1)
%     ops.rho = m(i,1);
%     Zf = spectral_fusion(E, Zh, Zm, B, M, R, ops);
%     Zf = reshape(Zf.',100,100,198);
%     m(i,2) = psnr(Zf,Z);
%     m(i,3) = ssim(Zf,Z);
%     cont = 1;
%     for j=1:size(Zf,1)
%         for k=1:size(Zf,2)
%             endm(i,1) = sam(reshape(Zf(1,1,:),1,198),reshape(Z(1,1,:),1,198));
%             cont = cont+1;
%         end
%     end
%     m(i,4) = mean(endm);
% end
% save("Metricas.mat","m")