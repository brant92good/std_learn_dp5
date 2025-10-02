# This code must be runned in this directory

exp_name=std_learn_dp5
downstream=FSD_asvspoof
# Run the training script
cd ../code/GSLM/prompt
python train.py --downstream ${downstream} --vb_method learnable --exp_name ${exp_name} --prompt_length 5 --deep_prompt --linear_verbalizer