function state = getstate(G, I)
%GETSTATE Summary of this function goes here
%   Detailed explanation goes here
    name = G.Nodes.Name(I);
    state = eval(name{1});
end

