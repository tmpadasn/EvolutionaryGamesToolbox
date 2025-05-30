function PP = get_stationary_colors(P, cmap_name)
    if nargin < 2
        cmap_name = 'jet'; % default colormap
    end

    % Compute stationary distribution
    [vecs, vals] = eig(P');
    [~, idx] = min(abs(diag(vals) - 1));
    stat_dist = abs(vecs(:, idx));
    stat_dist = stat_dist / sum(stat_dist);

    % Normalize and apply colormap
    cmap = feval(cmap_name, 256);
    stat_dist_norm = (stat_dist - min(stat_dist)) / (max(stat_dist) - min(stat_dist) + eps);
    col_idx = max(1, round(stat_dist_norm * 255)) + 1;
    PP = cmap(col_idx, :);

end