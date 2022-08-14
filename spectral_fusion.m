function [Z] = spectral_fusion(Zh, Zm, B, M, R, ops)
    % Se inicializan las variables:
    A = randn(4,10000);
    a = 0;
    b = 1;
    E = (b-a).*rand(198,4) + a;
    %E = randn(198,4);
    % Ciclo principal del algoritmo:
    for i=1:ops.n
        A = abundances_step(A, E, Zh, Zm, B, M, R, ops);
        E = endmembers_step(A, E, Zh, Zm, B, M, R, ops);
    end
    % Se inicializan las variables:
    Z = E*A;
end