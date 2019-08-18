#!/bin/bash

#SBATCH -J job-parallel
#SBATCH -N 3 # 3 nodes
#SBATCH -n 3 # 3 tasks
#SBATCH -c 1 # 1 core per task
#SBATCH -t 00:01:00 # time required, here it is 1 min
#SBATCH -o script.out

module load python

# Execute jobs in parallel
srun -N 1 -n 1 python test.py 0 &
srun -N 1 -n 1 python test.py 1 &
srun -N 1 -n 1 python test.py 2 &
wait


