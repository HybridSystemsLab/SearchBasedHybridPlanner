function [G, Q, edge_map, reachedset, visitedmap, isextended, Iextended] = extend(I, direction, U_C, U_D, G, Q, edge_map, reachedset, visitedmap, plotflag)
%EXTEND Summary of this function goes here
%   Detailed explanation goes here

isextended = 0;
Iextended = [];
x_cur = getstate(G, I);

if direction == 1
    for u = U_C
        if  C(x_cur, u)
            for rule = 1:2
                [x_new, psi_new] = new_state(u, x_cur, 1, direction, rule);
                flag_unsafety = checkanyunsafe(psi_new, size(x_new, 1));
                if (flag_unsafety)
                    continue;
                end
                [flag, index] = Isintree(reachedset, I, x_new);
                if (~flag)
                    [G, I_new, edge_map, reachedset] = addnodetograph(G, x_new, edge_map,reachedset);
                    
                    [G, edge_map] = addedgetograph(G, I, I_new, edge_map, psi_new);
                    
                    isextended = 1;
                    Iextended = [Iextended, I_new];
                    if(plotflag)
                        plotvertices(x_cur, x_new, direction);
                        plotsearchtree(psi_new, x_cur, x_new, direction)
                    end
                else
                    %                     [G, edge_map] = addedgetograph(G, I, index, edge_map, psi_new);
                    if (plotflag)
                        %plotsearchtree(psi_new, x_cur, x_new, direction);
                    end
                    I_new = index;
                end
                if (~visitedmap.isKey(I_new))
                    visitedmap(I_new) = 1;
                    Q = [Q, I_new];
                end
            end
        end
    end
    
    for u = U_D
        if D(x_cur, u)
            [x_new, psi_new] = new_state(u, x_cur, 2, direction, 1);
            [flag, index] = Isintree(reachedset, I, x_new);
            flag_unsafety = checkanyunsafe(psi_new, size(x_new, 1));
            if (flag_unsafety)
                continue;
            end
            if (~flag)
                [G, I_new, edge_map, reachedset] = addnodetograph(G, x_new, edge_map,reachedset);
                [G, edge_map] = addedgetograph(G, I, I_new, edge_map, psi_new);
                isextended = 1;
                Iextended = [Iextended, I_new];
                if (plotflag)
                    plotvertices(x_cur, x_new, direction)
                    plotsearchtree(psi_new, x_cur, x_new, direction)
                end
            else
                [G, edge_map] = addedgetograph(G, I, index, edge_map, psi_new);
                I_new = index;
                if(plotflag)
                    %plotsearchtree(psi_new, x_cur, x_new, direction);
                end
            end
            if (~visitedmap.isKey(I_new))
                visitedmap(I_new) = 1;
                Q = [Q, I_new];
            end
        end
    end
else
    for u = U_C
        if  C_bw(x_cur, u)
            for rule = 1: 2
                [x_new, psi_new] = new_state(u, x_cur, 1, direction, rule);
                flag_unsafety = checkanyunsafe(psi_new, size(x_new, 1));
                if (flag_unsafety)
                    continue;
                end
                [flag, index] = Isintree(reachedset, I, x_new);
                if (~flag)
                    [G, I_new, edge_map, reachedset] = addnodetograph(G, x_new, edge_map,reachedset);
                    
                    [G, edge_map] = addedgetograph(G, I, I_new, edge_map, psi_new);
                    
                    isextended = 1;
                    Iextended = [Iextended, I_new];
                    if (plotflag)
                        plotvertices(x_cur, x_new, direction)
                        plotsearchtree(psi_new, x_cur, x_new, direction)
                    end
                else
                    %                     [G, edge_map] = addedgetograph(G, I, index, edge_map, psi_new);
                    I_new = index;
                    if (plotflag)
                        %plotsearchtree(psi_new, x_cur, x_new, direction);
                    end
                end
                if (~visitedmap.isKey(I_new))
                    visitedmap(I_new) = 1;
                    Q = [Q, I_new];
                end
            end
        end
    end
    for u = U_D
        if D_bw(x_cur, u)
            [x_new, psi_new] = new_state(u, x_cur, 2, direction, 1);
            flag_unsafety = checkanyunsafe(psi_new, size(x_new, 1));
            if (flag_unsafety)
                continue;
            end
            [flag, index] = Isintree(reachedset, I, x_new);
            if (~flag)
                [G, I_new, edge_map, reachedset] = addnodetograph(G, x_new, edge_map,reachedset);
                
                [G, edge_map] = addedgetograph(G, I, I_new, edge_map, psi_new);
                
                isextended = 1;
                Iextended = [Iextended, I_new];
                if (plotflag)
                    plotvertices(x_cur, x_new, direction)
                    plotsearchtree(psi_new, x_cur, x_new, direction)
                end
            else
                [G, edge_map] = addedgetograph(G, I, index, edge_map, psi_new);
                
                I_new = index;
                if (plotflag)
                    %plotsearchtree(psi_new, x_cur, x_new, direction);
                end
            end
            if (~visitedmap.isKey(I_new))
                visitedmap(I_new) = 1;
                Q = [Q, I_new];
            end
        end
    end
end

end

