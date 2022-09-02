clc;
clear;

load("datasets\gt.mat")
E = M;
load("datasets\operators.mat")
load("Estimacion_E.mat")
M = M.';
load("datasets\Model_norm.mat")
 
ops.rho = 1;
ops.niter = 15;
n = 10;
A = rand(4,10000);
I1=eye(10000);
W1A = inv(M*M.'+I1);
for k=1:n
    A = abundances_step(A, E, Zh, Zm, B, M, R, ops, W1A);
end
Zf = E*A;
Zf = reshape(Zf.',100,100,198);
m = zeros(1,6);
endm = zeros(10000,1);
m(1,1) = ops.rho;
cont = 1;
m(1,2) = psnr(Zf,Z);
m(1,3) = ssim(Zf,Z);
Zfsam = reshape(Zf,10000,198);
Zsam = reshape(Z,10000,198);
for j=1:size(Zfsam,1)
    endm(j,1) = sam(Zfsam(j,:),Zsam(j,:));
end
m(1,4) = mean(endm);
m(1,5) = max(Zf(:));
m(1,6) = min(Zf(:));
%save("Zf_E.mat","Zf")