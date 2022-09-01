clc;
clear;

load("datasets\gt.mat")
E = M;
load("datasets\operators.mat")
M = M.';
load("datasets\Model.mat")
 
ops.rho = 0.96;
ops.niter = 20;
n = 10;
A = rand(4,10000);
I1=eye(10000);
W1A = inv(M*M.'+I1);
for i=1:n
    A = abundances_step(A, E, Zh, Zm, B, M, R, ops, W1A);
end

Zf = E*A;
Zf = reshape(Zf.',100,100,198);
imagesc(Zf(:,:,1));
save("Zf_E.mat","Zf")