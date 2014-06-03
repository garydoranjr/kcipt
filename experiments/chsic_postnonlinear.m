function chsic_postnonlinear(independent, noise, trial, N, outputfile)
    args.independent = independent;
    args.dimensions = (noise + 1);
    data = synthetic('caseI', trial, N, args);

    start = tic;
    [v1 pvalue statistic] =...
        hsiccondTestIC(data.X, data.Y, data.Z, 0.01, 1000);
    runtime = toc(start);

    fileid = fopen(outputfile, 'a+');
    line = sprintf('%d,%d,%d,%d,%f,%f,%f\n',...
            independent, noise, trial, N, runtime, statistic, pvalue);
    fprintf(line);
    fprintf(fileid, line);
    fclose(fileid);
end
