# SpeechPrompt v2 reformat
## dataset prep
read code/docs/dataset.md if you don't know where to find download link, I would recommend symbolic link to save space if you already have dataset exists on your computer
```
datasets
└── ASV2019LA
    ├── ASVspoof2019_LA_asv_protocols
    ├── ASVspoof2019_LA_asv_scores
    ├── ASVspoof2019_LA_cm_protocols
    ├── ASVspoof2019_LA_dev
    ├── ASVspoof2019_LA_eval
    └── ASVspoof2019_LA_train
```
## environment prep
you have to clone fairseq first, and copy the path as we will install it through pip in editable mode
```bash
git clone https://github.com/facebookresearch/fairseq.git
```
> Important! edit the last line of environment.yml to the path where you clone fairseq
```bash
mamba install -f code/environment.yml #swap to conda if you like
mamba activate SpeechPrompt-v2
```
## good to know
> config file localtion were inside `code/GSLM` folder, `preprocess/config` & `preprocess/{downstream}/config`, `prompt/config`

> although the project uses fairseq, it overwrites some of the fairseq code inside `code/GSLM/prompt/fairseq_cli` for custom feature. I would recommend using diff to trace the code for better efficiency (which I haven't finish doing)


## Run the code
``` bash
cd script #run in this folder
chmod +x preprocess.bash
chmod +x train.bash
chmod +x sample.bash
./preprocess.bash
./train.bash
./sample.bash
```
> you will find EER results in `storage/GSLM/exp_results/././samples/eer_results.txt`

> The original repo doesn't have EER calculate program nor token's probability stored for EER calculate, we impliment it in `code/GSLM/prompt/fairseq_cli/sample.py` and `code/GSLM/prompt/calculate.py`, double check the details if needed
