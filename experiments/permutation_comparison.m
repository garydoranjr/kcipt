function permutation_comparison(distance, independent, dimensions, trial, N, outputfile)
    options.distance = distance;
    args.independent = independent;
    args.dimensions = dimensions;

    data = synthetic('caseI', trial, N, args);
    X = data.X;
    Y = data.Y;
    Z = data.Z;
    k_Z = rbf(median_pdist(Z));

    % Parse Options
    if ~isfield(options, 'split')
        options.split = 1;
    end

    n = length(X);
    halfn = floor(n/2);

    % Split dataset in half?
    if options.split
        X1 = X(1:halfn,:);
        X2 = X(halfn+1:2*halfn,:);
        Y1 = Y(1:halfn,:);
        Y2 = Y(halfn+1:2*halfn,:);
        Z1 = Z(1:halfn,:);
        Z2 = Z(halfn+1:2*halfn,:);
    else
        X1 = X; X2 = X;
        Y1 = Y; Y2 = Y;
        Z1 = Z; Z2 = Z;
    end

    % Compute distance
    if strcmp(options.distance, 'regression')
        D = regression_distance(Y1, Z1);
    elseif strcmp(options.distance, 'symmetric_regression')
        D = regression_distance([X1 Y1], Z1);
    elseif strcmp(options.distance, 'rkhs')
        D = rkhs_distance(Z1, k_Z);
    elseif strcmp(options.distance, 'random')
        D = [];
    else
        error(sprintf('Unknown distance metric "%s"',...
                      options.distance));
    end

    % Compute permutation
    if isempty(D)
        P = eye(halfn);
        [notUsed, indperm] = sort(rand(halfn, 1));
        P = P(indperm, :);
    else
        P = linear_permutation(D);
    end

    % Measure pairwise distances along first dimension
    k_Z = rbf(median_pdist(Z(:,1)));
    D = rkhs_distance(Z1(:,1), k_Z);
    statistic = sum(sum(P.*D))/halfn;

    fileid = fopen(outputfile, 'a+');
    line = sprintf('%s,%d,%d,%d,%d,%f\n',...
            distance,independent, dimensions, trial, N, statistic);
    fprintf(line);
    fprintf(fileid, line);
    fclose(fileid);
end
