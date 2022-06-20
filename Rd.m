function [Zm] = Rd(Z,R)
    Zt = reshape(Z,10000,198);
    Zt = transpose(Zt);
    Zm = R*Zt;
    Zm = transpose(Zm);
    Zm = reshape(Zm,[100,100,3]);
end