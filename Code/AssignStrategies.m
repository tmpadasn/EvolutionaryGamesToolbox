function Players = AssignStrategies(Pop, Strategies)
    Players = [];
    for s = 1:length(Pop)
        Players = [Players repelem({Strategies{s}}, Pop(s))];
    end
end