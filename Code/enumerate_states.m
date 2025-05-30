% --- Helper: Enumerate all possible states for N players and M strategies ---
function states = enumerate_states(N, M)
    if M == 1
        states = N;
    else
        states = [];
        for ni = 0:N
            sub_states = enumerate_states(N - ni, M - 1);
            states = [states; ni * ones(size(sub_states, 1), 1), sub_states];
        end
    end
end