clc;
clear;

load("Metricas_1.5-0.1.mat");
plot(m(:,1),m(:,2))
title("PSNR vs Rho")
ylabel("PSNR")
xlabel("Rho")