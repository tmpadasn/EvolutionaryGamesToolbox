function [POP, BST] = TourSimImi(B, Strategies, POP0, K, T, J)
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
            totalPayoffs = payoffs; 
        
            maxPayoff = max(totalPayoffs);
            bestStrats = find(totalPayoffs == maxPayoff);
            nonBestStrats = setdiff(1:numStrats, bestStrats);
            
            newCounts = counts;
        
            % Βρες όλους τους παίκτες από μη-βέλτιστες στρατηγικές
            candidateIndices = [];
            for s = nonBestStrats
                candidateIndices = [candidateIndices, repmat(s, 1, counts(s))];
            end
        
            % Αν δεν υπάρχουν αρκετοί παίρνουμε όσους υπάρχουν
            K_effective = min(K, length(candidateIndices));
            chosenToSwitch = randsample(candidateIndices, K_effective);
        
            % Αφαίρεσε 1 παίκτη από κάθε στρατηγική που επιλέχθηκε
            for s = chosenToSwitch
                newCounts(s) = newCounts(s) - 1;
            end
        
            % Για κάθε παίκτη που αλλάζει, διάλεξε τυχαία μια βέλτιστη στρατηγική
            newChoices = randsample(bestStrats, K_effective, true);
            for s = newChoices
                newCounts(s) = newCounts(s) + 1;
            end
        
            % Ενημέρωσε τον πληθυσμό για την επόμενη γενιά
            POP(gen+1, :) = newCounts;
        end
    end
end
