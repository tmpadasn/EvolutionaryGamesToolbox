function Scores = Axel(B, Strategies, Pop, T)
    N = sum(Pop);
    Scores = zeros(1, N);
    PlayerStrategies = AssignStrategies(Pop, Strategies);
    for i = 1:N-1
        for j = i+1:N
            [Payoff1, Payoff2] = MatchPayoff(PlayerStrategies{i}, PlayerStrategies{j}, B, T);
            Scores(i) = Scores(i) + Payoff1;
            Scores(j) = Scores(j) + Payoff2;
        end
    end
end