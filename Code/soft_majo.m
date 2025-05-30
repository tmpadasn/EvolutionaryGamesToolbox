function Move = soft_majo(History)
    if isempty(History)
        Move = 1;  % Cooperate first
    else
        coop = sum(History(:, 2) == 1);
        def = sum(History(:, 2) == 2);
        if coop >= def
            Move = 1;
        else
            Move = 2;
        end
    end
end