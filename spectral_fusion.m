function [Z] = spectral_fusion(Zh, Zm, B, M, R, ops)
    % Se inicializan las variables:
    A = rand(4,10000);
    E = rand(198,4);
    %E = randn(198,4);
    % Ciclo principal del algoritmo:
    for i=1:ops.n
        A = abundances_step(A, E, Zh, Zm, B, M, R, ops);
        E = endmembers_step(A, E, Zh, Zm, B, M, R, ops);
    end
    % Se inicializan las variables:
    Z = E*A;
end
