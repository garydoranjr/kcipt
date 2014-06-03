function chsic_chaotic(independent, gamma, noise, trial, N, outputfile)
    args.gamma = gamma;
    args.noise = noise;
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

    start = tic;
    [v1 pvalue statistic] = hsiccondTestIC(X, Y, Z, 0.01, 1000);
    runtime = toc(start);

    fileid = fopen(outputfile, 'a+');
    line = sprintf('%d,%f,%d,%d,%d,%f,%f,%f\n',...
            independent, gamma, noise, trial, N, runtime, statistic, pvalue);
    fprintf(line);
    fprintf(fileid, line);
    fclose(fileid);
end
