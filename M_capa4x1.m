function [Zb] = M_capa4x1(Z,B)
Z=reshape(Z.',100,100,4);
Y = fft2(B); %Tranformada en Fourier 2D
for i=1:size(Z,3)
    F=fft2(Z(:,:,i));
    BZ(:,:,i)=F;
    B1(:,:,i)=BZ(:,:,i).*Y;
    B2(:,:,i)=(ifft2(B1(:,:,i)));
end
Zb = B2;
Zb = reshape(Zb,10000,4);
Zb = Zb.';
end