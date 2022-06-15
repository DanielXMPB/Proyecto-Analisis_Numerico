function [Zb] = Bd(Z,B)
    Bf = fft2(B);
    for i=1:198
        Zb = fft2(Z(:,:,i));
        Zb = Zb.*Bf;
        Zb = ifft(Zb);
        Z(:,:,i) = Zb;
    end
    Zb = Z;
end