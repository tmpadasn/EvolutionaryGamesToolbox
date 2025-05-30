function Move = per_ddc(History)
    cycle = mod(size(History, 1), 3);
    if cycle == 2
        Move = 1;  % Cooperate
    else
        Move = 2;  % Defect
    end
end