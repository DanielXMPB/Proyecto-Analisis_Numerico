clc;
clear;

load("datasets\Model.mat");
Zh = reshape(Zh,625,198);
Zh = Zh.';
E = VCA(Zh, 'Endmembers', 4, 'verbose', 'off');
save("Estimacion_E.mat","E")
plot(E)