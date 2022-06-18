function [Zb] = Bd(Z,B)
Y = fft2(B); %Tranformada en Fourier 2D
%imagesc(abs(fftshift(Y)))
for i=1:198
    F=fft2(Z(:,:,i));
    BZ(:,:,i)=F;
    B1(:,:,i)=BZ(:,:,i).*Y;
    B2(:,:,i)=(ifft2(B1(:,:,i)));
end
%imagesc(abs(fftshift(BZ(:,:,198))))
%imagesc(abs(fftshift(B1(:,:,198))))
imagesc(B2(:,:,198));
end
