function Z_SNR = SNR(Z,SNR)
    Z_SNR = Z;
    for i=1:198
        % Multiplicacion Banda a Banda
        Z_SNR(:,:,i) = Z_SNR(:,:,i)*Z_SNR(:,:,i);
        % Se saca el promedio
        Promedio = sum(sum(Z_SNR(:,:,i)))/10000;
        % Se saca la varianza
        Varianza = Promedio/10^(SNR/10);
        Z_SNR(:,:,i) = Z(:,:,i)+sqrt(Varianza)*randn(100,100);
    end
end

