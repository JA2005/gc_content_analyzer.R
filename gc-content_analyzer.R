###############################################
# GC Content Analyzer
# Author: JA2005
# Date: 2025-11-14
#
# Description:
#   A simple and useful tool for analyzing 
#   DNA sequences. It calculates:
#     - GC content
#     - AT content
#     - Sequence length
#   It also generates:
#     - A barplot of nucleotide composition
#   And saves:
#     - Summary results as CSV
#
# This script is ideal for genomics beginners 
# and contributes a reusable tool for researchers.
###############################################

# Install packages if not installed
if (!requireNamespace("Biostrings", quietly = TRUE)) {
  install.packages("BiocManager")
  BiocManager::install("Biostrings")
}

library(Biostrings)

# ---- 1. INPUT SEQUENCE ----
# You can change this DNA sequence or read from FASTA

dna_seq <- DNAString("ATGGCGATCGAATTCGCGATCGATTTAGCGCGA")

# ---- 2. BASIC ANALYSIS ----

seq_length <- length(dna_seq)
gc_count   <- letterFrequency(dna_seq, letters = "GC")
at_count   <- letterFrequency(dna_seq, letters = "AT")

gc_content <- gc_count / seq_length * 100
at_content <- at_count / seq_length * 100

# Print results
cat("Sequence Length:", seq_length, "\n")
cat("GC Content:", round(gc_content, 2), "%\n")
cat("AT Content:", round(at_content, 2), "%\n\n")

# ---- 3. BARPLOT OF NUCLEOTIDES ----

nt_counts <- letterFrequency(dna_seq, letters = c("A","T","G","C"))

png("nucleotide_composition.png", width = 600, height = 400)
barplot(nt_counts,
        main = "Nucleotide Composition",
        xlab = "Nucleotides",
        ylab = "Frequency")
dev.off()

# ---- 4. SAVE SUMMARY ----

results <- data.frame(
  Sequence_Length = seq_length,
  GC_Content = round(gc_content, 2),
  AT_Content = round(at_content, 2)
)

write.csv(results, "gc_content_summary.csv", row.names = FALSE)

cat("Analysis completed!\n")
cat("Saved: nucleotide_composition.png and gc_content_summary.csv\n")
