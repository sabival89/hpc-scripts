#!/bin/bash
#SBATCH --job-name=OPJob        # job name (shows up in the queue)
#SBATCH --time=00:01:00         # Walltime (HH:MM:SS)
#SBATCH --cpus-per-task=8       # cores.
#SBATCH --ntasks=2              # number of tasks (e.g. MPI)
#SBATCH --output=slurm-test.out # output file
#SBATCH --nodes=1		# number of nodes to use
#SBATCH --nodelist=discovery-c4 #specific node(s) to use

# Load MPI modules
module load openmpi
module load gcc

# Compile the C program
mpicc -fopenmp program.c -o program

#Get the number of processors assigned by Slurm
echo "Running on $SLURM_NTASKS processor(s): $SLURM_NODELIST"

# Show the number of cores requested per task (Only set if the option is specified)
echo "Running $SLURM_CPUS_PER_TASK cores per task using $(($SLURM_CPUS_PER_TASK*$SLURM_NTASKS*$SLURM_NTASKS)) threads on $SLURM_NODELIST"

# Execute the C program
srun ./program > program.out



