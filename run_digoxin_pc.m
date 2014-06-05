function run_digoxin_pc()
    addpath('bnt');
    addpath(genpathKPM('bnt'));
    addpath('kcipt');
    addpath('data');
    load digoxin.dat;
    mu = mean(digoxin, 1);
    sd = std(digoxin, 0, 1);
    mus = repmat(mu, size(digoxin, 1), 1);
    sds = repmat(sd, size(digoxin, 1), 1);
    scaled_digoxin = (digoxin - mus) ./ sds;

    % MATLAB 2010
    % (For repeatability)
    s = RandStream('mcg16807','Seed',0);
    RandStream.setDefaultStream(s);

    citest = kcipt_pc(scaled_digoxin, 0.05);
    P = learn_struct_pdag_pc(citest, 3, 3)
    type digoxin.names
end
