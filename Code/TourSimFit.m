function [POP, BST, FIT] = TourSimFit(B, Strategies, POP0, T, J)
    numStrats = length(Strategies);    % Αριθμός στρατηγικών
    POP = zeros(J, numStrats);         % Πληθυσμός ανα γενεά
    FIT = zeros(J, numStrats);         % Fitness ανα στρατηγική
    BST = zeros(J, 1);                 % Καλύτερη στρατηγική ανα γενεά

    POP(1, :) = POP0;                  % Αρχικός πληθυσμός

    for gen = 1:J
        payoffs = zeros(1, numStrats);
        counts = POP(gen, :);   % Πληθυσμός για αυτή τη γενιά

        % Παίξε αγώνες μεταξύ όλων των στρατηγικών
        % Παίξε αγώνες μεταξύ όλων των στρατηγικών
        for i = 1:numStrats
            for j = 1:numStrats
                if counts(i) > 0 && counts(j) > 0
                    % Παίξε T γύρους ανάμεσα στις στρατηγικές i και j
                    [p1, p2] = MatchPayoff(Strategies{i}, Strategies{j}, B, T);
                    % Υπολόγισε συνολικό payoff ανα στρατηγική
                    if i == j
                        nGames = counts(i) * (counts(i)-1) / 2; % αγώνες μεταξύ ίδιων
                    else
                        nGames = counts(i) * counts(j);
                    end
                    payoffs(i) = payoffs(i) + p1 * nGames;
                    payoffs(j) = payoffs(j) + p2 * nGames;
                end
            end
        end

        % Υπολόγισε fitness (μέσο payoff ανά παίκτη της στρατηγικής)
        fitness = zeros(1, numStrats);
        for s = 1:numStrats
            if counts(s) > 0
                fitness(s) = payoffs(s) / counts(s);
            end
        end

        FIT(gen, :) = fitness;
        [~, BST(gen)] = max(fitness);

        if gen < J
            % Ευριστικός κανόνας: fitness ως ποσοστά * συνολικούς παίκτες
            newCounts = round((fitness / sum(fitness)) * sum(counts));
            
            POP(gen+1, :) = newCounts;
        end
    end
end
