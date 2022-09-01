function [A] = abundances_step(A,E,Zh,Zm,B,M,R,ops,W1)
    % Se inicializan matrices identidad y Bt
    I2=eye(4);
    n = size(B, 1);
    Bt = B([1 n:-1:2], [1 n:-1:2]);
    
    % Se guardan las matrices inversas
    WA = ifft2(fft2(B) .* fft2(Bt));
    WA(1,1) = WA(1,1)+2;
    WA = ifft2(1./fft2(WA));
    W2=inv(E.'*E+ops.rho*I2);
    W3=inv((R*E).'*(R*E)+ops.rho*I2);

    %Variables Adicionales
    Zht=reshape(Zh,625,198);
    Zmt=reshape(Zm,10000,3);

    % Se inicializan V y U
    U1=zeros(4,10000);
    U2=zeros(4,625);
    U3=zeros(4,10000);
    U4=zeros(4,10000);
    V1=MxB(A,B);
    V2=V1*M;
    V3=A;
    V4=A;

    % inicia iteracion 
    for i=1:ops.niter
        A=((MxB(V1,Bt)-MxB(U1,Bt))+V3-U3+V4-U4);
        A=MxB(A,WA);
        V1=((MxB(A,B))+U1+V2*M.'-U2*M.')*W1;
        V2=W2*(E.'*Zht.'+(ops.rho*(V1*M))+(ops.rho*U2));
        V3=W3*((R*E).'*Zmt.'+ops.rho*A+ops.rho*U3);
        for j=1:size(V4,2)
            V4(:,j)=projsplx(A(:,j)+U4(:,j));
        end
        U1=U1-V1+MxB(A,B);
        U2=U2-V2+V1*M;
        U3=U3-V3+A;
        U4=U4-V4+A;
    end
    A = V4;
end