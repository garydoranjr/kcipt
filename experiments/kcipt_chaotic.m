function kcipt_chaotic(distance, null_estimate, outer_samples,...
                       inner_samples, independent, gamma, trial, N,...
                       outputfile)
    options.null_estimate = null_estimate;
    options.distance = distance;
    options.bootstrap_samples = inner_samples;
    boptions.bootstrap_samples = outer_samples;
    args.independent = independent;
    args.gamma = gamma;
    args.noise = 2;

    data = synthetic('henon', trial, N, args);

    if independent
        X = data.Xt1;
        Y = data.Yt;
        Z = data.Xt(:,1:2);
    else
        X = data.Yt1;
        Y = data.Xt;
        Z = data.Yt(:,1:2);
    end

    k_X = rbf(median_pdist(X));
    k_Y = rbf(median_pdist(Y));
    k_Z = rbf(median_pdist(Z));

    new_test = bootstrap(@kcipt, boptions);

    start = tic;
    [statistic null] = new_test(X, Y, Z, k_X, k_Y, k_Z, options);
    pval = null.pvalue(statistic);
    runtime = toc(start);

    fileid = fopen(outputfile, 'a+');
    line = sprintf('%s,%s,%d,%d,%d,%f,%d,%d,%f,%f,%f\n',...
            distance, null_estimate,...
            outer_samples, inner_samples,...
            independent, gamma, trial, N, runtime,...
            statistic, pval);
    fprintf(line);
    fprintf(fileid, line);
    fclose(fileid);
end
