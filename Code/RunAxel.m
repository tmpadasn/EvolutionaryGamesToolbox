B = [3 1; 4 2];
Strategies = {'AllC', 'AllD'};
Pop = [1, 1];
T = 10;
Scores = Axel(B, Strategies, Pop, T);
PlayerStrats = {};
for i = 1:sum(Pop)
    for j = 1:size(Pop, ndims(Pop))
        MaxStratPop = 0;
        for k = 1:j
            MaxStratPop = MaxStratPop + Pop(k);
        end
        if i <= MaxStratPop
            PlayerStrats(i) = Strategies(j);
            break
        end
    end
end

for i = 1:sum(Pop)
    fprintf('Player %3d\t\tStrat: %s\t\tScore = %d\n', i, PlayerStrats{i}, Scores(1, i));
end