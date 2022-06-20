#!/bin/env bash
#SBATCH --partition=shared-gpu
#SBATCH --time=02:00:00
#SBATCH --gpus=1
#SBATCH --output=kraken-%j.out
#SBATCH --mem=0

module load fosscuda/2020b Python/3.8.6
source ~/kraken-env/bin/activate

OUTPUT_NAME="output_name"
XML_FOLDER="/home/users/g/paupeel1/corpus_prevot_farine_fr/B168"

echo $SLURM_NODELIST
echo "KETOS training"
srun ketos train -o $OUTPUT_NAME -f alto -t train.txt -e eval.txt -d cuda:0 -r 0.0001 "${XML_FOLDER}/*.xml"