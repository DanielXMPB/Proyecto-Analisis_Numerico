function [Zb] = Bd(Z,B)
Y = fft2(B); %Tranformada en Fourier 2D
for i=1:size(Z,3)
    F=fft2(Z(:,:,i));
    BZ(:,:,i)=F;
    B1(:,:,i)=BZ(:,:,i).*Y;
    B2(:,:,i)=(ifft2(B1(:,:,i)));
end
Zb = B2;
end
