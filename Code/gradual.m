function Move = gradual(History)
    persistent defection_count retaliation_left
    if isempty(defection_count)
        defection_count = 0;
        retaliation_left = 0;
    end

    % Reset state if starting a new match
    if isempty(History)
        defection_count = 0;
        retaliation_left = 0;
        Move = 1;  % Cooperate first
        return;
    end

    % Count new defections from opponent
    if History(end, 2) == 2  % Opponent defected last move
        defection_count = defection_count + 1;
        retaliation_left = defection_count;
    end

    % Retaliate
    if retaliation_left > 0
        retaliation_left = retaliation_left - 1;
        Move = 2;  % Defect
        return;
    end

    % After retaliation: 2 cooperations
    past = size(History, 1);
    if past >= 2 && all(History(end-1:end, 1) == 1)
        Move = 1;  % Cooperate
    else
        Move = 1;  % Keep cooperating unless told otherwise
    end
end