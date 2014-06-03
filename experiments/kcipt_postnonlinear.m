function kcipt_postnonlinear(distance, null_estimate, outer_samples,...
                             inner_samples, independent, dimensions,...
                             trial, N, outputfile)
    options.null_estimate = null_estimate;
    options.distance = distance;
    options.bootstrap_samples = inner_samples;
    boptions.bootstrap_samples = outer_samples;
    args.independent = independent;
    args.dimensions = dimensions;

    data = synthetic('caseI', trial, N, args);
    X = data.X;
    Y = data.Y;
    Z = data.Z;
    k_X = rbf(median_pdist(X));
    k_Y = rbf(median_pdist(Y));
    k_Z = rbf(median_pdist(Z));

    new_test = bootstrap(@kcipt, boptions);

    start = tic;
    [statistic null] = new_test(X, Y, Z, k_X, k_Y, k_Z, options);
    pval = null.pvalue(statistic);
    runtime = toc(start);

    fileid = fopen(outputfile, 'a+');
    line = sprintf('%s,%s,%d,%d,%d,%d,%d,%d,%f,%f,%f\n',...
            distance, null_estimate,...
            outer_samples, inner_samples,...
            independent, dimensions, trial, N, runtime,...
            statistic, pval);
    fprintf(line);
    fprintf(fileid, line);
    fclose(fileid);
end
