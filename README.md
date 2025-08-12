# README

## 1. Data sources

This task is based on publicly available sequencing data from a study of **\[insert study topic here]**. The dataset includes multiple samples under different conditions (e.g., treated vs. control) and was originally sequenced using **\[insert platform, e.g., Illumina 2×150]**.
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

Uses seqtk to extract 25% of reads from each sample

```bash
cd tcruzi_submission/data
./subsample.sh
```

---

## 4. How the workflow works

The workflow files is stored in `workflow/`.

---

### Step 1 – Re-run nextflow workflow described in article

**Purpose:** Remove low-quality reads and adapter sequences, align to a reference and generate a count matrix
**Tools:** `nextflow`, `fastp`, `kraken2`, `STAR`, `featureCounts`
**Inputs:** Subsampled FASTQ files (from`data/sra_data_downsampled/`)
**Outputs:** Cleaned FASTQs, QC reports, Count Matrix
**Command:**

```bash
nextflow run iaradsouza1/gene_exp_tcruzi -r add-fastp -profile docker
    --input samplesheet.csv \
    --outdir results_tcruzi \
    -resume \
    --kraken2_db https://genome-idx.s3.amazonaws.com/kraken/k2_eupathdb48_20230407.tar.gz \
    --fasta data/reference_files/TriTrypDB-64_TcruziG_Genome.fasta \
    --gtf data/reference_files/TriTrypDB-64_TcruziG.gtf

```

---

### Step 2 - Perform differential expression analysis

**Purpose:** Find differentially expressed genes between the conditions, while accounting for the strain
**Tools:** `R`, `DESeq2`
**Inputs:** Count Matrix, metadata table
**Outputs:** Table of differentially expressed genes
**Command:**

---

### Step X – Analysis (e.g., DESeq2, variant calling, etc.)

**Purpose:** ...
**Tools:** ...
**Inputs:** ...
**Outputs:** ...
**Command:**
