function [Zm] = Md(Z,M)
    Zt = reshape(Z,[10000,198]);
    Zt = transpose(Zt);
    Mt = transpose(M);
    Zm = Zt*Mt;
    Zm = transpose(Zm);
    Zm = reshape(Zm,[25,25,198]);
end