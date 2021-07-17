function [G, I_new, edge_map, reachedset] = addnodetograph(G, x_new, edge_map, reachedset)
%ADDNODETOGRAPH Summary of this function goes here
%   Detailed explanation goes here
    G = addnode(G,mat2str(x_new, 16));
    I_new = numnodes(G);
    edge_map(I_new) = containers.Map('KeyType','double','ValueType','any');
    reachedset = addstatetoreachedset(x_new, reachedset, I_new);
end

