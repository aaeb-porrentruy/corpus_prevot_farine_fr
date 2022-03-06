
#!/bin/sh bash
#SBATCH --partition=public-gpu
#SBATCH --time=2-00:00:00
#SBATCH --gpus=1
#SBATCH --output=kraken-%j.out
#SBATCH --mem=0

module load fosscuda/2020b Python/3.8.6
source ~/kraken-env/bin/activate
pip install albumentations


OUTPUT_NAME="output_name"
XML_FOLDER="/home/users/p/paupeel1/corpus_prevot_farine_fr"

echo "KETOS training"
srun ketos segtrain -f alto -t train.txt -e eval.txt -d cuda "${XML_FOLDER}/*.xml"