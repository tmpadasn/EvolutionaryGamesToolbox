function P = TourTheImi(B,Strategies,POP0,K,T,J)

    numStrats = length(Strategies);
    POP = zeros(J, numStrats);
    POP(1,:) = POP0;
    Pi = sum(POP0);  % Total population remains constant

    % Προϋπολογισμός πίνακα αποδόσεων
    V = zeros(numStrats);
    for i = 1:numStrats
        for j = 1:numStrats
            [p1, ~] = MatchPayoff(Strategies{i}, Strategies{j}, B, T);
            V(i,j) = p1;
        end
    end

    for gen = 1:J
        W = POP(gen, :);  % Πληθυσμός της γενιάς
        g = zeros(1, numStrats);  % Scores

        for i = 1:numStrats
            g(i) = W * V(i,:)' - V(i,i);
        end

        bestscore = max(g);
        countbest = sum(g == bestscore);
        beststrategies = find(g == bestscore); 

        worst2scores = mink(g,2);
        [~, worst2strategies] = mink(g,2);
        
        P = zeros(numStrats);

        for t = 1:numStrats
            if ismember(t, beststrategies)
                P(t, t) = 1;  % Αν είναι ήδη βέλτιστος, μένει ίδιος
            else
                P(t, beststrategies) = 1 / countbest;  % Αλλιώς αλλάζει ομοιόμορφα σε κάποια βέλτιστη
            end
        end
        
        % Κατανομή K αλλαγών μεταξύ των δύο χειρότερων
        badness1 = bestscore - worst2scores(1);
        badness2 = bestscore - worst2scores(2);
        totalbadness = badness1 + badness2;

        if totalbadness == 0
            K1 = floor(K/2);
        else
            K1 = round(K * badness1 / totalbadness);
        end
        K2 = K - K1;

        % Αρχικοποίηση νέου πληθυσμού
        newW = W;

        % Αφαίρεση παικτών από τις δύο χειρότερες στρατηγικές
        if newW(worst2strategies(1)) >= K1
            newW(worst2strategies(1)) = newW(worst2strategies(1)) - K1;
        else
            K1 = newW(worst2strategies(1));
            newW(worst2strategies(1)) = 0;
        end

        if newW(worst2strategies(2)) >= K2
            newW(worst2strategies(2)) = newW(worst2strategies(2)) - K2;
        else
            K2 = newW(worst2strategies(2));
            newW(worst2strategies(2)) = 0;
        end

        % Προσθήκη παικτών σε καλύτερες στρατηγικές
        for k = 1:(K)
            chosen = beststrategies(randi(countbest));  % τυχαία επιλογή
            newW(chosen) = newW(chosen) + 1;
        end

        % Αποθήκευση επόμενης γενιάς
        if gen < J
            POP(gen+1, :) = newW;
        end
    end

    % Επιστροφή πίνακα μετάβασης P — για συμβατότητα, εδώ ως τελικός πληθυσμός
    P = POP;
end