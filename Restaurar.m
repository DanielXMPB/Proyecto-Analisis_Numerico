clc;
clear;

load("datasets\Model_35.mat")
load("datasets\operators.mat")

% Se invierten las filas
%imagesc(B)
fila_ini = 2;
fila_fin = 100;
while fila_ini ~= fila_fin
    B([fila_ini fila_fin],:) = B([fila_fin fila_ini],:);
    fila_ini = fila_ini+1;
    fila_fin = fila_fin-1;
end
colum_ini = 2;
colum_fin = 100;
%Se inviertene las columnas
%figure,imagesc(B)
while colum_ini ~= colum_fin
    B([colum_ini colum_fin],:) = B([colum_fin colum_ini],:);
    colum_ini = colum_ini+1;
    colum_fin = colum_fin-1;
end
%figure,imagesc(B)

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
Zh_restaurada = Bd(Zh_restaurada,B);
figure,imagesc(Zh_restaurada(:,:,198))
matfile('Zm_35_Restaurado.mat','Writable',true);
save('Model_35_Restaurado.mat','Zm_restaurada','Zh_restaurada','Z')

