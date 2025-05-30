function Move = per_cd(History)
    if mod(size(History, 1), 2) == 0
        Move = 1;  % Cooperate
    else
        Move = 2;  % Defect
    end
end