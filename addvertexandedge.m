function  [outT, outedgelist, Q] = addvertexandedge(x, u, t, j, T, I, edgelist, Q)
%ADDVERTEXANDEDGE Summary of this function goes here
%   Detailed explanation goes here
nodecontent = [x(:, end)'];
if (Isintree(T, nodecontent))
    outT = T;
    outedgelist = edgelist;
else
    [outT, I_new] = T.(I, nodecontent);
    Q = [Q, I_new];
    m_edgelist = size(edgelist, 1);
    outedgelist = edgelist;
    outedgelist{m_edgelist + 1, 1} = I;
    outedgelist{m_edgelist + 1, 2} = I_new;
    outedgelist{m_edgelist + 1, 3} = x;
    outedgelist{m_edgelist + 1, 4} = u;
    outedgelist{m_edgelist + 1, 5} = t;
    outedgelist{m_edgelist + 1, 6} = j;
end

end

