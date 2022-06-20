function [Zh] = Md(Z,M)
    Zt = reshape(Z,10000,198);
    Zt = transpose(Zt);
    Zh = Zt*M;
    Zh = transpose(Zh);
    Zh = reshape(Zh,[25,25,198]);
end