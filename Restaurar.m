clc;
clear;

load("datasets\Model_35.mat")
load("datasets\operators.mat")

n = size(B, 1);
Bt = B([1 n:-1:2], [1 n:-1:2]);
%figure,imagesc(Bt)

% Z original
figure,imagesc(Z(:,:,198))

% Restaurar Zm
Zm_restaurada = reshape(Zm,10000,3);
Zm_restaurada = Zm_restaurada*R;
Zm_restaurada = reshape(Zm_restaurada,100,100,198);
figure,imagesc(Zm_restaurada(:,:,198))
matfile('Zm_35_Restaurado.mat','Writable',true);

% Restaurar Zh
Zh_restaurada = reshape(Zh,625,198);
Zh_restaurada = transpose(M)*Zh_restaurada;
Zh_restaurada = reshape(Zh_restaurada,100,100,198);
Zh_restaurada = Bd(Zh_restaurada,Bt);
figure,imagesc(Zh_restaurada(:,:,198))
matfile('Zm_35_Restaurado.mat','Writable',true);
save('Model_35_Restaurado.mat','Zm_restaurada','Zh_restaurada','Z')

