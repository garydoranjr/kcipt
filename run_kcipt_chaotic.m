function run_kcipt_chaotic()
    addpath('gpml-matlab/gpml');
    addpath('kcipt');
    addpath('algorithms');
    addpath('data');
    addpath('experiments');
    for gamma=0.0:0.1:0.5
        for trial=0:299
            for independent=0:1
                for N=[200 400]
                    kcipt_chaotic('rkhs', 'bootstrap', 10, 1000, independent, gamma, trial, N, 'results/kcipt_chaotic.csv');
                end
            end
        end
    end
end
