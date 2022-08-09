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
    WA=B.*Bt;
    WA(1,1)=WA(1,1)+2*ops.rho;
    %WA=1./WA;
    for i=1:size(WA,1)
        for j=1:size(WA,2)
            if WA(i,j)~=0
                WA(i,j)=1/WA(i,j);
            end
        end
    end
    WA=B*Bt;
    WA=WA(1,1)+2*ops.rho;
    WA=1/WA;  %Inversa
    W1=inv(M*M.'+I1);
    W2=inv(E.'*E+ops.rho*I2);
    W3=inv((R*E).'*(R*E)+ops.rho*I2);
    %Variables Adicionales
    Zht=reshape(Zh,625,198);
    Zmt=reshape(Zm,10000,3);
    % inicia iteracion 
    for i=1:ops.niter
        A=((M_capa4x1(V1,Bt)-M_capa4x1(U1,Bt))+V3-U3+V4-U4);
        A=M_capa4x1(A,WA);
        V1=((M_capa4x1(A,B))+U1+V2*M.'-U2*M.')*W1;
        V2=W2*(E.'*Zht.'+(ops.rho*(U1*M))+(ops.rho*U2));
        V3=W3*((R*E).'*Zmt.'+ops.rho*A+ops.rho*U3);
        for j=1:size(V4,2)
            V4(:,j)=projsplx(A(:,j)+U4(:,j));
        end
        U1=U1+V1-M_capa4x1(A,B);
        U2=U2+V2-V1*M;
        U3=U3+V3-A;
        U4=U4+V4-A;
    end
end
