clear;
clc;

coco_flag_list = [false, false; true, false; true, true]';

shock_flag_list = [false, false, false, false; ...
                   true, false, false, false; ...
                   true, true, false, false]';

for sct = 0.45:0.05:0.6
    for ict = 0.2:0.05:0.6
        for coco_flag = coco_flag_list
            for shock_flag = shock_flag_list
                simulation(coco_flag', shock_flag', sct, ict);
            end
        end
    end
end