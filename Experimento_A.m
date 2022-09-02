clc;
clear;

load("datasets\gt.mat")
load("datasets\operators.mat")
M = M.';
load("datasets\Model.mat")
 
ops.rho = 1;
ops.niter = 15;
n = 10;
E = rand(198,4);
I3=eye(10000);
I4=eye(198);
W2E=inv((M*M.')+ops.rho*I3);
W3E=inv((R.'*R)+ops.rho*I4);
for i=1:n
    E = endmembers_step(A, E, Zh, Zm, B, M, R, ops, W2E, W3E);
end

Zf = E*A;
Zf = reshape(Zf.',100,100,198);
save("Zf_A.mat","Zf")