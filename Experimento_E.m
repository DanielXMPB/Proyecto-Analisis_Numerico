clc;
clear;

load("datasets\gt.mat")
E = M;
load("datasets\operators.mat")
M = M.';
load("datasets\Model.mat")
 
ops.rho = 1.1;
ops.niter = 20;
n = 10;
A = rand(4,10000);
for i=1:n
    A = abundances_step(A, E, Zh, Zm, B, M, R, ops);
end

Zf = E*A;
Zf = reshape(Zf.',100,100,198);
imagesc(Zf(:,:,1));
save("Zf_E.mat","Zf")