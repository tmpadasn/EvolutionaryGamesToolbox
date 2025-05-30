function P = TourTheImi(B, Strategies, POP0, K, T, J)

M = length(Strategies);     % Number of strategies
N = sum(POP0);              % Total number of players

% Step 1: Precompute average payoffs for every strategy pair
V = zeros(M, M);
for i = 1:M
    for j = 1:M
        [p1, ~] = MatchPayoff(Strategies{i}, Strategies{j}, B, T);
        V(i, j) = p1;  % Payoff to player using strategy i against j
    end
end

% Step 2: Enumerate all possible states (distributions of N players into M strategies)
states = enumerate_states(N, M);
L = size(states, 1);      % Number of states

% Step 3: Initialize transition matrix
P = zeros(L, L);

% Step 4: For every state, consider possible single-player switches (imitation events)
for l = 1:L
    s = states(l, :);  % Current state

    % For each "from" strategy (who might imitate another strategy)
    for from = 1:M
        if s(from) == 0
            continue;
        end

        % Compute payoff for switching to each possible strategy
        payoffs = zeros(1, M);
        for to = 1:M
            tmp_state = s;
            tmp_state(from) = tmp_state(from) - 1;
            tmp_state(to) = tmp_state(to) + 1;
            % Calculate payoff for being 'to' in this population
            payoff = 0;
            for opp = 1:M
                opp_count = tmp_state(opp);
                if to == opp
                    opp_count = opp_count - 1; % exclude self
                end
                if opp_count < 0
                    opp_count = 0;
                end
                payoff = payoff + V(to, opp) * opp_count;
            end
            payoffs(to) = payoff;
        end

        % Find strategies that maximize payoff (Φ)
        max_payoff = max(payoffs);
        best_strats = find(payoffs == max_payoff);

        % For each optimal imitation, increment corresponding transition
        for idx = 1:length(best_strats)
            to = best_strats(idx);
            new_state = s;
            new_state(from) = new_state(from) - 1;
            new_state(to) = new_state(to) + 1;
            % Only valid states
            if any(new_state < 0)
                continue;
            end
            l2 = find(ismember(states, new_state, 'rows'));
            if ~isempty(l2)
                P(l, l2) = P(l, l2) + 1/length(best_strats); % Uniform if tie
            end
        end
    end
end

% Step 5: Normalize each row (to make P a stochastic matrix)
for l1 = 1:L
    row_sum = sum(P(l1, :));
    if row_sum > 0
        P(l1, :) = P(l1, :) / row_sum;
    else
        % Absorbing state: population can't change
        P(l1, l1) = 1;
    end
end

end

