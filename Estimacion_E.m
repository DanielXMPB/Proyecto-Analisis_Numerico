clc;
clear;

load("datasets\Model_norm.mat");
Zh = reshape(Zh,625,198);
Zh = Zh.';
E = hyperVCA(Zh,  4);
E = max(0, E);
save("Estimacion_E.mat","E")
plot(E)