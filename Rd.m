function [Zr] = Rd(Z,R)
    Zt = reshape(Z,[10000,198]);
    Zt = transpose(Zt);
    Zr = R*Zt;
    Zr = transpose(Zr);
    Zr = reshape(Zr,[100,100,3]);
end