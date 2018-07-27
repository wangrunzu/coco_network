#!/bin/bash
#SBATCH --partition=normal
#SBATCH --exclusive
#SBATCH --ntasks=20
#SBATCH --ntasks-per-node=20
#SBATCH --output=simulation_%J_stdout.txt
#SBATCH --error=simulation_%J_stderr.txt
#SBATCH --time=4:00:00
#SBATCH --job-name=coco_simulation
#SBATCH --mail-user=wangrunzu@ou.edu
#SBATCH --mail-type=ALL
#SBATCH --workdir=/home/wangrunzu/coco_network/code/

module load MATLAB/2018a
matlab -nodisplay -r simulation_script
