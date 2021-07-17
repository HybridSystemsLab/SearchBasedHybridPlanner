function [G, Q, edge_map, reachedset, visitedmap, isextended, Iextended] = extend(I, direction, U_C, U_D, G, Q, edge_map, reachedset, visitedmap)
%EXTEND Summary of this function goes here
%   Detailed explanation goes here

global kthvertex
global kthedge

isextended = 0;
Iextended = [];
x_cur = getstate(G, I);

if direction == 1
    if  C(x_cur)
        for u = U_C
            for rule = 1:2
                [x_new, psi_new] = new_state(u, x_cur, 1, direction, rule);
                flag_unsafety = checkanyunsafe(psi_new, size(x_new, 1));
                if (flag_unsafety)
                    continue;
                end
                [flag, index] = Isintree(reachedset, I, x_new);
                if (~flag)
                    [G, I_new, edge_map, reachedset] = addnodetograph(G, x_new, edge_map,reachedset);
                    plotvertices(x_cur, x_new, direction)
                    [G, edge_map] = addedgetograph(G, I, I_new, edge_map, psi_new);
                    plotsearchtree(psi_new, x_cur, x_new, direction)
                    isextended = 1;
                    Iextended = [Iextended, I_new];
%                     fprintf('the %d th vertex is added to the search graph!\n', kthvertex); kthvertex = kthvertex + 1;
%                     fprintf('the %d th edge is added to the search graph!\n', kthedge); kthedge = kthedge + 1;
                    %                 edge_matrix{I, I_new} = psi_new;
                else
                    [G, edge_map] = addedgetograph(G, I, index, edge_map, psi_new);
                    plotsearchtree(psi_new, x_cur, x_new, direction);
                    I_new = index;
%                     fprintf('the %d th edge is added to the search graph!\n', kthedge); kthedge = kthedge + 1;
                    %edge_matrix{I, index} = psi_new;
                end
                if (~visitedmap.isKey(I_new))
                    visitedmap(I_new) = 1;
                    Q = [Q, I_new];
                end
            end
        end
    end
    
    if D(x_cur)
        for u = U_D
            [x_new, psi_new] = new_state(u, x_cur, 2, direction, 1);
            [flag, index] = Isintree(reachedset, I, x_new);
            flag_unsafety = checkanyunsafe(psi_new, size(x_new, 1));
            if (flag_unsafety)
                continue;
            end
            if (~flag)
                [G, I_new, edge_map, reachedset] = addnodetograph(G, x_new, edge_map,reachedset);
                plotvertices(x_cur, x_new, direction)
                [G, edge_map] = addedgetograph(G, I, I_new, edge_map, psi_new);
                plotsearchtree(psi_new, x_cur, x_new, direction)
                isextended = 1;
                Iextended = [Iextended, I_new];
%                 fprintf('the %d th vertex is added to the search graph!\n', kthvertex); kthvertex = kthvertex + 1;
%                 fprintf('the %d th edge is added to the search graph!\n', kthedge); kthedge = kthedge + 1;
                %                 edge_matrix{I, I_new} = psi_new;
            else
                [G, edge_map] = addedgetograph(G, I, index, edge_map, psi_new);
                plotsearchtree(psi_new, x_cur, x_new, direction);
                I_new = index;
%                 fprintf('the %d th edge is added to the search graph!\n', kthedge); kthedge = kthedge + 1;
                %edge_matrix{I, index} = psi_new;
            end
            if (~visitedmap.isKey(I_new))
                visitedmap(I_new) = 1;
                Q = [Q, I_new];
            end
        end
    end
else
    if  C_bw(x_cur)
        for u = U_C
            for rule = 1: 2
                [x_new, psi_new] = new_state(u, x_cur, 1, direction, rule);
                flag_unsafety = checkanyunsafe(psi_new, size(x_new, 1));
                if (flag_unsafety)
                    continue;
                end
                [flag, index] = Isintree(reachedset, I, x_new);
                if (~flag)
                    [G, I_new, edge_map, reachedset] = addnodetograph(G, x_new, edge_map,reachedset);
                    plotvertices(x_cur, x_new, direction)
                    [G, edge_map] = addedgetograph(G, I, I_new, edge_map, psi_new);
                    plotsearchtree(psi_new, x_cur, x_new, direction)
                    isextended = 1;
                    Iextended = [Iextended, I_new];
%                     fprintf('the %d th vertex is added to the search graph!\n', kthvertex); kthvertex = kthvertex + 1;
%                     fprintf('the %d th edge is added to the search graph!\n', kthedge); kthedge = kthedge + 1;
                    %                 edge_matrix{I, I_new} = psi_new;
                else
                    [G, edge_map] = addedgetograph(G, I, index, edge_map, psi_new);
                    plotsearchtree(psi_new, x_cur, x_new, direction);
                    I_new = index;
%                     fprintf('the %d th edge is added to the search graph!\n', kthedge); kthedge = kthedge + 1;
                    %edge_matrix{I, index} = psi_new;
                end
                if (~visitedmap.isKey(I_new))
                    visitedmap(I_new) = 1;
                    Q = [Q, I_new];
                end
            end
        end
    end
    if D_bw(x_cur)
        for u = U_D
            [x_new, psi_new] = new_state(u, x_cur, 2, direction, 1);
            flag_unsafety = checkanyunsafe(psi_new, size(x_new, 1));
            if (flag_unsafety)
                continue;
            end
            [flag, index] = Isintree(reachedset, I, x_new);
            if (~flag)
                [G, I_new, edge_map, reachedset] = addnodetograph(G, x_new, edge_map,reachedset);
                plotvertices(x_cur, x_new, direction)
                [G, edge_map] = addedgetograph(G, I, I_new, edge_map, psi_new);
                plotsearchtree(psi_new, x_cur, x_new, direction)
                isextended = 1;
                Iextended = [Iextended, I_new];
%                 fprintf('the %d th vertex is added to the search graph!\n', kthvertex); kthvertex = kthvertex + 1;
%                 fprintf('the %d th edge is added to the search graph!\n', kthedge); kthedge = kthedge + 1;
                %                 edge_matrix{I, I_new} = psi_new;
            else
                [G, edge_map] = addedgetograph(G, I, index, edge_map, psi_new);
                plotsearchtree(psi_new, x_cur, x_new, direction);
                I_new = index;
%                 fprintf('the %d th edge is added to the search graph!\n', kthedge); kthedge = kthedge + 1;
                %edge_matrix{I, index} = psi_new;
            end
            if (~visitedmap.isKey(I_new))
                visitedmap(I_new) = 1;
                Q = [Q, I_new];
            end
        end
    end
end

end

