clear;
clc;

coco_flag_list = [false, false, false; true, false, false; true, true, false]';

shock_flag_list = [false, false, false, false; ...
                   true, false, false, false; ...
                   true, true, false, false]';

% pc = parcluster('local')
% parpool(pc, str2num(getenv('SLURM_CPUS_ON_NODE')))

for junior = 0:0.05:1
    for shock_flag = shock_flag_list
        simulation_two_tranches([true, true, true], [true, false, true, false], junior);
    end
end

% for sys = 0.2:0.05:0.8
%     for ind = 0.2:0.05:0.8
%         for coco_flag = coco_flag_list
%             for shock_flag = shock_flag_list
%                 simulation_coco_triggers(coco_flag, shock_flag, ind, sys)
%             end
%         end
%     end
% end
