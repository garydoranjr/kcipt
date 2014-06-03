function run_chsic_postnonlinear()
    addpath('CI_PERM');
    addpath('data');
    addpath('experiments');
    for noise=0:4
        for trial=0:299
            for independent=0:1
                for N=[200 400]
                    chsic_postnonlinear(independent, noise, trial, N, 'results/chsic_postnonlinear.csv');
                end
            end
        end
    end
end
