clear;
clc;

coco_flag_list = [false, false; true, false; true, true]';

shock_flag_list = [false, false, false, false; ...
                   true, false, false, false; ...
                   true, true, false, false]';

pc = parcluster('local')
parpool(pc, str2num(getenv('SLURM_CPUS_ON_NODE')))

for junior = 0:0.05:1
    for shock_flag = shock_flag_list
        simulation([true, true, true], shock_flag', junior);
    end
end
