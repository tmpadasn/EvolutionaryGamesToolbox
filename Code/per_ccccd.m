function Move = per_ccccd(History)
    cycle = mod(size(History, 1), 5);
    if cycle == 4
        Move = 2;  % Defect
    else
        Move = 1;  % Cooperate
    end
end