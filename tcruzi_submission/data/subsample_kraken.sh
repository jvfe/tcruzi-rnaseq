#!/usr/bin/bash
set -e

nextflow run jvfe/krakenclassify \
        --input samplesheet.csv \
        --kraken2_db https://genome-idx.s3.amazonaws.com/kraken/k2_eupathdb48_20230407.tar.gz \
        --outdir subsampled_results \
        -profile docker \
        -r add-targzipped-ref \
        -with-tower \
        -resume
