#!/bin/bash
set -e

nextflow run jvfe/krakenclassify -r sepal -profile docker,test \
    --input data/samplesheet.csv \
    --outdir results_tcruzi \
    --fasta data/reference_files/TriTrypDB-64_TcruziG_Genome.fasta \
    --gtf data/reference_files/TriTrypDB-64_TcruziG.gtf \
    -resume