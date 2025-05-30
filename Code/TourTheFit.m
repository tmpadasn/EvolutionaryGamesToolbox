function [POP, BST, FIT] = TourTheFit(B, Strategies, POP0, T, J)
    numStrats = length(Strategies);
    POP = zeros(J, numStrats);
    FIT = zeros(J, numStrats);
    BST = zeros(J, 1);
    
    POP(1,:) = POP0;
    Pi = sum(POP0);  % Total population remains constant

    % Precompute payoff matrix V(i,j)
    V = zeros(numStrats);
    for i = 1:numStrats
        for j = 1:numStrats
            [p1, ~] = MatchPayoff(Strategies{i}, Strategies{j}, B, T);
            V(i,j) = p1;
        end
    end

    for gen = 1:J
        W = POP(gen, :);  % Population of generation n
        g = zeros(1, numStrats);  % Fitness g_n(i)
        
        for i = 1:numStrats
            g(i) = W * V(i,:)' - V(i,i);
        end
        
        FIT(gen, :) = g;

        % Total distributed points
        total_points = sum(W .* g);
        
        if total_points == 0
            POP(gen+1:J, :) = repmat(W, J-gen, 1);  % No change
            break;
        end

        % Update population for next generation
        newW = floor((Pi * W .* g) / total_points);
        

        % Save next generation population
        if gen < J
            POP(gen+1, :) = newW;
        end

        % Store best strategy
        [~, BST(gen)] = max(g);
    end
end