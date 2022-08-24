clc;
clear;

load("datasets\gt.mat")
load("datasets\operators.mat")
M = M.';
load("datasets\Model.mat")
 
ops.rho = 0.57;
ops.niter = 20;
n = 10;
E = rand(198,4);
for i=1:n
    E = endmembers_step(A, E, Zh, Zm, B, M, R, ops);
end

Zf = E*A;
Zf = reshape(Zf.',100,100,198);
imagesc(Zf(:,:,1));
save("Zf_A.mat","Zf")