function idx = Sta2Num001(stateVec, S)
% Find the row index in S that matches stateVec
    idx = find(ismember(S, stateVec, 'rows'), 1);
    if isempty(idx)
        error('State not found in S.');
    end
end