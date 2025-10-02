# This code must be runned in this directory

#define the dataset used
dataset=FSD_asvspoof ##modify this to run on different datasets

# Run the preprocessing script
cd ../code/GSLM/preprocess
python runner.py --model GSLM --downstream ${dataset} --action all

cd ../prompt
python verbalizer.py --downstream ${dataset} --action all --method learnable

python fairseq_preprocess.py --downstream ${dataset} --vb_method learnable