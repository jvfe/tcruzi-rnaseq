# README

## 1. Data sources

This task is based on publicly available sequencing data from study **\[P21 Ablation Unveils Strain-Specific Transcriptional Reprogramming in Trypanosoma cruzi Amastigotes]**. The dataset includes multiple samples under different conditions (e.g., treated vs. control) and was originally sequenced using **\[Illumina HiSeq2500]**.
The subsampled and cleaned FASTQs are stored in `data/` and are used as the inputs for the workflow.

---

## 2. How to download

Data acquired from SRA

```bash
cd tcruzi_submission/data
./download.sh
```

---

## 3. Pre-processing / subsampling

Uses a version of the analysis workflow to extract only protozoa reads (encompassing T. cruzi)

```bash
cd tcruzi_submission/data
./subsample_kraken.sh
```

Then filter down to only 25% of reads

```bash
./subsample.sh
```

---

## 4. How the workflow works

The workflow files is stored in `workflow/`.

---

### Step 1 – Re-run nextflow workflow described in article

**Purpose:** Remove low-quality reads and adapter sequences, align to a reference and generate a count matrix
**Tools:** `nextflow`, `fastp`, `hisat2`, `featureCounts`
**Inputs:** Subsampled FASTQ files (from`data/sra_data_downsampled/`)
**Outputs:** Cleaned FASTQs, QC reports, Count Matrix
**Command:**

```bash
bash workflow/run_pipeline.sh
```

---

### Step 2 - Perform differential expression analysis

**Purpose:** Find differentially expressed genes between the conditions, while accounting for the strain
**Tools:** `R`, `DESeq2`
**Inputs:** Count Matrix, metadata table
**Outputs:** Table of differentially expressed genes
**Command:**

```bash
quarto render workflow/run_dge.qmd
```
