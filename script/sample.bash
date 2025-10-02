# This code must be runned in this directory

task=FSD_asvspoof
exp_name=std_learn_dp5
# Run the sampling script
cd ../code/GSLM/prompt
python sample.py --downstream ${task} --vb_method learnable --exp_name ${exp_name}

python calculate.py --downstream ${task} --exp_name ${exp_name}