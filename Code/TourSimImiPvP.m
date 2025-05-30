function [POP, BST] = TourSimImiPvP(B, Strategies, POP0, K, T, J)

    numStrats = length(Strategies);

    % Δημιουργία αρχικού πληθυσμού παικτών με στρατηγική
    Players = [];
    for s = 1:numStrats
        Players = [Players, repmat(s, 1, POP0(s))];
    end

    POP = zeros(J, numStrats);
    FIT = zeros(J, numStrats);
    BST = zeros(J, 1);

    for gen = 1:J
        N = length(Players);
        scores = zeros(1, N);

        % Αντιστοίχισε στρατηγικές στους παίκτες
        PlayerStrategies = cell(1, N);
        for i = 1:N
            PlayerStrategies{i} = Strategies{Players(i)};
        end

        % PvP αγώνες - round-robin
        for i = 1:N-1
            for j = i+1:N
                [p1, p2] = MatchPayoff(PlayerStrategies{i}, PlayerStrategies{j}, B, T);
                scores(i) = scores(i) + p1;
                scores(j) = scores(j) + p2;
            end
        end

        % Υπολογισμός fitness ανά στρατηγική
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

        % Καταγραφή πληθυσμού
        for s = 1:numStrats
            POP(gen, s) = sum(Players == s);
        end

        % Αντιγραφή στρατηγικών βάσει imitation
        if gen < J
            counts = POP(gen, :);
            payoffs = stratFitness;
            newCounts = counts;

            maxPayoff = max(payoffs);
            bestStrats = find(payoffs == maxPayoff);
            nonBestStrats = setdiff(1:numStrats, bestStrats);

            % Δημιούργησε λίστα υποψηφίων προς αλλαγή στρατηγικής
            candidateIndices = [];
            for s = nonBestStrats
                candidateIndices = [candidateIndices, repmat(s, 1, counts(s))];
            end

            % Επιλογή παικτών προς αλλαγή
            K_effective = min(K, length(candidateIndices));
            if K_effective > 0
                chosenToSwitch = randsample(candidateIndices, K_effective);

                % Αφαίρεση από παλιές στρατηγικές
                for s = chosenToSwitch
                    newCounts(s) = newCounts(s) - 1;
                end

                % Αντικατάσταση με βέλτιστες στρατηγικές
                newChoices = randsample(bestStrats, K_effective, true);
                for s = newChoices
                    newCounts(s) = newCounts(s) + 1;
                end
            end

            % Δημιουργία νέων παικτών
            Players = [];
            for s = 1:numStrats
                Players = [Players, repmat(s, 1, newCounts(s))];
            end

            POP(gen+1, :) = newCounts;
        end
    end
end
