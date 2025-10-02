# SpeechPrompt v2 Reformat

Guidance for preparing datasets, configuring the environment, and running the SpeechPrompt v2 pipeline.

## Dataset preparation

If you need download links, check `code/docs/dataset.md`. When the dataset already exists on your machine, create symbolic links to avoid duplicating large files.

Expected directory layout:

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

## Environment setup

1. Clone Fairseq so it can be installed in editable mode:

   ```bash
   git clone https://github.com/facebookresearch/fairseq.git
   ```

2. Update the last line of `environment.yml` so it points to your local Fairseq path.
3. Create and activate the environment:

   ```bash
   mamba install -f code/environment.yml  # swap to conda if preferred
   mamba activate SpeechPrompt-v2
   ```

## Helpful notes

- Configuration files live under `code/GSLM`, particularly `preprocess/config`, `preprocess/{downstream}/config`, and `prompt/config`.
- The project overrides several Fairseq modules in `code/GSLM/prompt/fairseq_cli` to add custom behaviour. Diffing against upstream Fairseq helps when you need to trace those changes. (which I haven't)

## Run the pipeline

Execute the scripts from the `script` directory:

```bash
cd script
chmod +x preprocess.bash train.bash sample.bash
./preprocess.bash
./train.bash
./sample.bash
```
scripts contain the best parameter to use for training reported in the paper (learnable+linear verbalizer, deep prompt, prompt_length 5)

Equal Error Rate results are saved to `storage/GSLM/exp_results/././samples/eer_results.txt`.

Because the original repository did not calculate EER or store token probabilities, both features were added in `code/GSLM/prompt/fairseq_cli/sample.py` and `code/GSLM/prompt/calculate.py`. Review those files for implementation details when needed.
