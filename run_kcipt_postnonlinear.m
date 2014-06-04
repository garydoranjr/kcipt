function run_kcipt_postnonlinear()
    addpath('gpml-matlab/gpml');
    addpath('algorithms');
    addpath('kcipt');
    addpath('data');
    addpath('experiments');
    % Main experiments
    for dimensions=1:5
        for trial=0:299
            for independent=0:1
                for N=[200 400]
                    kcipt_postnonlinear('symmetric_regression','bootstrap', 25, 10000, independent, dimensions, trial, N, 'results/kcipt_postnonlinear.csv');
                end
            end
        end
    end

    % For high-dimensional experiments
    N = 400
    for dimensions=[10 20 50]
        for trial=0:299
            for independent=0:1
                kcipt_postnonlinear('symmetric_regression','bootstrap', 25, 10000, independent, dimensions, trial, N, 'results/kcipt_postnonlinear.csv');
            end
        end
    end
end
