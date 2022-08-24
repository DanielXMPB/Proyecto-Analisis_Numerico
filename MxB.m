function [Zb] = MxB(Z,B)
if size(Z,1) == 198
    Z=reshape(Z.',100,100,198);
elseif size(Z,1) == 4
    Z=reshape(Z.',100,100,4);
end
Zb = Bd(Z,B);
if size(B2,3) == 198
    Zb = reshape(Zb,10000,198);
elseif size(B2,3) == 4
    Zb = reshape(Zb,10000,4);
end
Zb = Zb.';
end