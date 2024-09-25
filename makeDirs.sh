#!/bin/bash

# Root README title and subtitle
echo "# CIS 655 Advanced Computer Architecture" > README.md
echo "## Table of Contents" >> README.md

# Titles for each week
titles=(
  "Week 1 Fundamentals of Quantitative Design and Analysis"
  "Week 2 Processor Design"
  "Week 3 Advanced Pipelining and I/O"
  "Week 4 Memory Hierarchy Design"
  "Week 5 Instruction-Level Parallelism (ILP)"
  "Week 6 Vector and GPU Architectures (DLP)"
  "Week 7 Multithreaded and Multicore Processors (Thread-Level Parallelism)"
  "Week 8 Shared-Memory Systems (Data-Level Parallelism)"
  "Week 9 Interconnection Networks"
  "Week 10 Request-Level Parallelism"
)

# Loop from 1 to 10 for folders and READMEs
for week in {1..10}; do
  # Create the folder name
  folder="week$week"
  
  # Make the directory
  mkdir -p "$folder"
  
  # Create the README.md file with the title and table of contents
  echo "# ${titles[$week-1]}" > "$folder/README.md"
  
  echo "## Table of Contents" >> "$folder/README.md"

  for i in {1..10}; do
    if [ $i -eq $week ]; then
      echo "- **&rarr;[${titles[$i-1]}](README.md)**" >> "$folder/README.md"**
      continue
    fi
    echo "- [${titles[$i-1]}](../week$i/README.md)" >> "$folder/README.md"
  done

  # Add hyperlink to the root README.md
  echo "- [${titles[$week-1]}](./$folder/README.md)" >> README.md
done