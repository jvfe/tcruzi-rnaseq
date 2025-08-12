#!/bin/bash

set -e

echo "--- Setting up directories ---"
mkdir -p sra_data reference_files

# -----------------------------------------------------------------------------
# 1. Download SRA Data using SRA Toolkit
# -----------------------------------------------------------------------------
# The file 'SRR_Acc_List.txt' should be in the same directory as this script.
# It contains the following accession numbers:
# SRR30522307
# SRR30522308
# SRR30522309
# SRR30522310

echo "--- Downloading SRA data ---"
cat SRR_Acc_List.txt | while read srr; do
  echo "Get $srr to FASTQ..."
  fastq-dump --split-files --gzip --outdir sra_data $srr
done

echo "--- SRA data download complete. Files are in sra_data/ ---"


# The methodology specifies T. cruzi G strain genome (Version 64) from TriTrypDB.

echo "--- Downloading reference files ---"
# Download the reference genome (FASTA)
wget -P reference_files https://tritrypdb.org/common/downloads/release-64/TcruziG/fasta/data/TriTrypDB-64_TcruziG_Genome.fasta

# Download the gene annotation file (GFF)
wget -P reference_files https://tritrypdb.org/common/downloads/release-64/TcruziG/gff/data/TriTrypDB-64_TcruziG.gff
gffread reference_files/TriTrypDB-64_TcruziG.gff -T -o reference_files/TriTrypDB-64_TcruziG.gtf

echo "--- Reference files download complete. Files are in reference_files/ ---"
echo "--- All downloads finished successfully! ---"