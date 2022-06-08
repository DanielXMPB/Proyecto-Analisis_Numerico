clear; 
clc;

load('JasperRidge.mat');
%imagesc(Z(:,:,198));
Blurring = imgaussfilt3(Z,0.75);
matfile('Blurring.mat','Writable',true);
save('Blurring.mat','Blurring')
%imagesc(Blurring(:,:,198))
Spatial = imresize3(Blurring,[25,25,198]);
matfile('Spatial.mat','Writable',true);
save('Spatial.mat','Spatial')
%imagesc(Spatial(:,:,198))
Spectral = imresize3(Z,[100,100,3]);
matfile('Spectral.mat','Writable',true);
save('Spectral.mat','Spectral')
%imagesc(Spectral(:,:,3))