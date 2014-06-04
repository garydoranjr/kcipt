function run_kcipt_bootstrap()
    addpath('gpml-matlab/gpml');
    addpath('algorithms');
    addpath('kcipt');
    addpath('data');
    addpath('experiments');
    N = 400;
    for dimensions=[1 3 5]
        for trial=0:299
            for independent=0:1
                for B=[1 5 10 15 20]
                    kcipt_postnonlinear('symmetric_regression','bootstrap', B, 10000, independent, dimensions, trial, N, 'results/kcipt_postnonlinear.csv');
                end
            end
        end
    end
end
