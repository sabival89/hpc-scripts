#!/bin/bash

#SBATCH --job-name=myprog #A single job name for the array
#SBATCH --cpus-per-task=2 #1 Physical core per task.
#SBATCH --nodes=1 #All tasks on one machine
#SBATCH --partition=normal #Partition
#SBATCH --time=0-2:00 #2 hours (D-HH:MM)
#SBATCH --output=myprog%A_%a.out #Standard output # %A" is replaced by the job ID and "%a" with the array index
#SBATCH --array=1-4 #Array of jobs to perform

echo "now processing task id:: " ${SLURM_ARRAY_TASK_ID}

# Process the input files and send their output to program-files/output/..
./program program-files/input/input${SLURM_ARRAY_TASK_ID}.txt > program-files/output/output_${SLURM_ARRAY_TASK_ID}.txt


