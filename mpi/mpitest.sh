#!/bin/bash -e
#SBATCH --job-name=MPIJob       # job name (shows up in the queue)
#SBATCH --time=00:01:00         # Walltime (HH:MM:SS)
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=16              # number of tasks (e.g. MPI)
#SBATCH --partition=normal
#SBATCH --nodelist=discovery-c4
#SBATCH --nodes=1

# Load MPI modules
module load mpich/3.3-gcc-4.8.5

# Compile the C program
mpicc -o mpitest mpitest.c

# Run the C program using mpirun or srun
srun -n 16 ./mpitest > mpitest.out

