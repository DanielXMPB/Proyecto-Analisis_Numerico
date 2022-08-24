function [Z] = spectral_fusion(E,Zh, Zm, B, M, R, ops)
    % Se inicializan las variables:
    A = rand(4,10000);

    % Ciclo principal del algoritmo:
    for i=1:ops.n
        A = abundances_step(A, E, Zh, Zm, B, M, R, ops);
        E = endmembers_step(A, E, Zh, Zm, B, M, R, ops);
    end

    % Se Fusiona la imagen:
    Z = E*A;
end
