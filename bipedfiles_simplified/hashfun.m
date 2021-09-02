function hashkeys = hashfun(x)
%HASHFUN Summary of this function goes here
%   Detailed explanation goes here
global tol
    N = size(x, 1);
    tols = tol*ones(N, 1);
    tols(3) = tols(3)/50;
    tols(6) = tols(6)/50;
    
    hashkeys = zeros(N, 1);
    for i = 1:N
        hashkeys(i) = ceil(x(i)/tols(i)); 
    end
end

