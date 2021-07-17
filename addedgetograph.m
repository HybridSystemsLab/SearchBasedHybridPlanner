function [G, edge_map] = addedgetograph(G, I, I_new, edge_map, psi_new)
%ADDEDGETOGRAPH Summary of this function goes here
%   Detailed explanation goes here
    G = addedge(G, I, I_new);
    hashtablefromI = edge_map(I);
    hashtablefromI(I_new) = psi_new;
    edge_map(I) = hashtablefromI;
end

