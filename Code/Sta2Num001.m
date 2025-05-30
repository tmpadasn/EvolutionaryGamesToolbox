function idx = Sta2Num001(state, S)
    idx = find(ismember(S, state, 'rows'), 1, 'first');
    if isempty(idx)
        error('State not found in S.');
    end
end