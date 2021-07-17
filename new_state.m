function [x_new, psi_new] = new_state(u, x_cur, evol, direction, rule)

if (evol == 1) %flow
    [x_new, psi_new] = flowpropagation(x_cur, u, direction, rule);
else
    if (evol == 2) % jump
        [x_new, psi_new] = jumppropagation(x_cur, u, direction);
    end
end

end