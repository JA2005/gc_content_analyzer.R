# 🧬 GC Content Analyzer (R)

A lightweight and practical R tool for analyzing DNA sequences.  
This script calculates **GC content, AT content, sequence length**, and generates a **nucleotide composition plot**—a useful starting point for genomics, molecular biology, and bioinformatics workflows.

---

## 🔍 Features

- Calculate:
  - GC Content (%)
  - AT Content (%)
  - Sequence Length
- Generate a **bar plot** of nucleotide frequencies
- Export results as:
  - `gc_content_summary.csv`
  - `nucleotide_composition.png`
- Uses **Biostrings** (Bioconductor) — widely used in genomics research

---

## 📦 Installation

Make sure you have R installed.  
Required package: **Biostrings**

```r
install.packages("BiocManager")
BiocManager::install("Biostrings")
