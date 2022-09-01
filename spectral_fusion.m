function [Z, A, E] = spectral_fusion(E, Zh, Zm, B, M, R, ops)
    % Inversas para las funciones
    I1=eye(10000);
    I3=eye(10000);
    I4=eye(198);
    W1A = inv(M*M.'+I1);
    W2E=inv((M*M.')+ops.rho*I3);
    W3E=inv((R.'*R)+ops.rho*I4);

    % Se inicializan las variables:
    A = rand(4,10000);

    % Ciclo principal del algoritmo:
    for i=1:ops.n
        A = abundances_step(A, E, Zh, Zm, B, M, R, ops, W1A);
        E = endmembers_step(A, E, Zh, Zm, B, M, R, ops, W2E, W3E);
    end

    % Se Fusiona la imagen:
    Z = E*A;
end
