function Move = per_ccd(History)
    cycle = mod(size(History, 1), 3);
    if cycle == 2
        Move = 2;  % Defect
    else
        Move = 1;  % Cooperate
    end
end