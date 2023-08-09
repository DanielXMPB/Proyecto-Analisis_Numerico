clc;
clear;

load("datasets\gt.mat")
load("datasets\operators.mat")
M = M.';
load("datasets\Model_norm.mat")
load("Estimacion_E.mat")

ops.rho = 1;
ops.niter = 20;
n = 20;
% E = rand(198,4);
I3=eye(10000);
I4=eye(198);
W2E=inv((M*M.')+ops.rho*I3);
W3E=inv((R.'*R)+ops.rho*I4);
for i=1:n
    E = endmembers_step(A, E, Zh, Zm, B, M, R, ops, W2E, W3E);
end

Zf = E*A;

Zf = reshape(Zf.', 100, 100, 198);


temp = reshape(A', [100 100 4]);
A = temp;
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
save("Zf_A.mat","Zf", 'E', 'A','m')