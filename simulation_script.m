clear;
clc;

coco_flag_list = [false, true, true; false, false, true];

shock_flag_list = [false, true, true; ...
                   false, false, true; ...
                   false, false, false; ...
                   false, false, false];

for coco_flag = coco_flag_list
    for shock_flag = shock_flag_list
        for ict = 0.25:0.05:0.35
            simulation(coco_flag', shock_flag', ict);
        end
    end
end