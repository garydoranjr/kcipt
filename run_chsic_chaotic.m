function run_chsic_chaotic()
    addpath('CI_PERM');
    addpath('data');
    addpath('experiments');
    for gamma=0:0.1:0.5
        for trial=0:299
            for independent=0:1
                for N=[200 400]
                    chsic_chaotic(independent, gamma, 2, trial, N, 'results/chsic_chaotic.csv');
                end
            end
        end
    end
end
