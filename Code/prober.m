function Move = prober(History)
    turn = size(History, 1);
    if turn == 0
        Move = 2;  % D
    elseif turn == 1 || turn == 2
        Move = 1;  % C, C
    elseif History(2,2) == 1 && History(3,2) == 1
        Move = 2;  % Defect forever
    else
        Move = History(end, 2);  % Tit-for-Tat
    end
end