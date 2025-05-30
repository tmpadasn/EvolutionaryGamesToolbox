function Move = tit_for_tat(History)
    if isempty(History)
        Move = 1;
    else
        Move = History(end, 2);
    end
end