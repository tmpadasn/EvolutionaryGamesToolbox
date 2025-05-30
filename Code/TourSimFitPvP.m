function [POP, BST, FIT] = TourSimFitPvP(B, Strategies, POP0, T, J)
    numStrats = length(Strategies);
    
    % Δημιουργία αρχικού πληθυσμού παικτών με στρατηγική
    Players = [];
    for s = 1:numStrats
        Players = [Players, repmat(s, 1, POP0(s))];
    end

    POP = zeros(J, numStrats);
    FIT = zeros(J, numStrats);
    BST = zeros(J, 1);
    POP(1, :) = POP0;

    for gen = 1:J
        N = sum(POP(gen, :));
        scores = zeros(1, N);

        % Αντιστοίχισε στρατηγικές στους παίκτες
        PlayerStrategies = cell(1, N);
        for i = 1:N
            PlayerStrategies{i} = Strategies{Players(i)};
        end

        % PvP αγώνες - τουρνουά round-robin
        for i = 1:N-1
            for j = i+1:N
                [p1, p2] = MatchPayoff(PlayerStrategies{i}, PlayerStrategies{j}, B, T);
                scores(i) = scores(i) + p1;
                scores(j) = scores(j) + p2;
            end
        end

        % Μέσο fitness ανά στρατηγική
        stratFitness = zeros(1, numStrats);
        stratCounts = zeros(1, numStrats);
        for i = 1:N
            s = Players(i);
            stratFitness(s) = stratFitness(s) + scores(i);
            stratCounts(s) = stratCounts(s) + 1;
        end

        for s = 1:numStrats
            if stratCounts(s) > 0
                stratFitness(s) = stratFitness(s) / stratCounts(s);
            end
        end

        FIT(gen, :) = stratFitness;
        [~, BST(gen)] = max(stratFitness);

        % Δημιουργία νέου πληθυσμού
        if gen < J
            totalPlayers = N;
            if sum(stratFitness) == 0
                newCounts = round(totalPlayers / numStrats * ones(1, numStrats));
            else
                newCounts = round((stratFitness / sum(stratFitness)) * totalPlayers);
            end

            % Διόρθωση για να διατηρείται το πλήθος παικτών σταθερό
            diff = totalPlayers - sum(newCounts);
            [~, idx] = max(stratFitness);
            newCounts(idx) = newCounts(idx) + diff;

            POP(gen + 1, :) = newCounts;

            % Δημιουργία νέων παικτών για την επόμενη γενιά
            Players = [];
            for s = 1:numStrats
                Players = [Players, repmat(s, 1, newCounts(s))];
            end
        end
    end
end
