function run_permutation_comparison()
    addpath('gpml-matlab/gpml');
    addpath('kcipt');
    addpath('algorithms');
    addpath('data');
    addpath('experiments');
    for trial=0:29
        for sz=[50 100 200 400 800]
             for dimensions=[1 3 5]
                for dist={'symmetric_regression', 'regression', 'rkhs', 'random'}
                    permutation_comparison(dist{1}, 1, dimensions, trial, sz, 'results/permutation_comparison.csv');
                end
            end
        end
    end
end
