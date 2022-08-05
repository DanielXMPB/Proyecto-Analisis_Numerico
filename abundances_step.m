function [A] = abundances_step(A,E,Zh,Zm,B,M,R,ops)
    % Se inicializan V y U
    V1=zeros(4,10000);
    V2=zeros(4,625);
    V3=zeros(4,10000);
    V4=zeros(4,10000);
    U1=zeros(4,10000);
    U2=zeros(4,625);
    U3=zeros(4,10000);
    U4=zeros(4,10000);
    % Se inicializan matrices identidad y Bt
    I1=eye(10000);
    I2=eye(4);
    n = size(B, 1);
    Bt = B([1 n:-1:2], [1 n:-1:2]);
    % Se guardan las matrices inversas
    WA=B*Bt;
    WA=WA(1,1)+2*ops.rho;
    W1=inv(M*M.'+I1);
    W2=inv(E.'*E+ops.rho*I2);
    W3=inv((R*E).'*(R*E)+ops.rho*I2);
    % inicia iteracion 
    for i=1:ops.niter
        A=(V1*Bt-U1*Bt+V3-U3+V4-U4)*WA;
        V1=(A*B+U1+V2*M.'-U2*M.')*W1;
        V2=W2*(E.'*Zh+ops.rho*U1*M+ops.rho*U2);
        V3=W3*((R*E).'*Zm+ops.rho*A+ops.rho*U3);
        V4=projspls(A);
        U1=U1+V1-A*B;
        U2=U2+V2-V1*M;
        U3=U3+V3-A;
        U4=U4+V4-A;
    end
end