function [E] = endmembers_step(A, E, Zh, Zm, B, M, R, ops)
    % Se inicializan V y U
    V1=zeros(198,10000);
    V2=zeros(198,10000);
    V3=zeros(198,10000);
    V4=zeros(198,4);
    U1=zeros(198,10000);
    U2=zeros(198,10000);
    U3=zeros(198,10000);
    U4=zeros(198,4);
    % Se inicializan matrices identidad y Bt
    I1=eye(4);
    I2=eye(100);
    I3=eye(10000);
    I4=eye(198);
    n = size(B, 1);
    Bt = B([1 n:-1:2], [1 n:-1:2]);
    % Se guardan las matrices inversas
    WE=inv(2*(A*A.')+I1);
    W1=inv((B*Bt)+I2);
    W2=inv((M*M.')+ops.rho*I3);
    W3=inv((R.'*R)+ops.rho*I4);
    %Variables Adicionales
    Zht=reshape(Zh,625,198);
    Zmt=reshape(Zm,10000,3);
    % inicia iteracion 
    for i=1:ops.niter
        E=(V1*A.'-U1*A.'+V3*A.'-U3*A.'+V4-U4)*WE;
        V1=(E*A)+U1+M_capa198x1(V2,Bt)-M_capa198x1(U2,Bt);
        V1=M_capa198x1(V1,W1);
        V2=(Zht.'*M.'+ops.rho*(M_capa198x1(V1,B))+ops.rho*U2)*W2;
        V3=W3*(R.'*Zmt.'+E*A+U3);
        for j=1:size(V4,2)
            V4(:,j)=projsplx(E(:,j)+U4(:,j));
        end
        U1=U1+V1-E*A;
        U2=U2+V2-M_capa198x1(V1,B);
        U3=U3+V3-E*A;
        U4=U4+V4-E;
    end
end