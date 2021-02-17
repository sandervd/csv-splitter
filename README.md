# Dependencies
- awk

# Usage
```
awk -f splitfile.awk big-csv-file.csv
```
A 'split' directory will be created, with a subfolder for each split file (0, 1, ...). Each of the numbered subfolders contains a csv file with the orginal name.
e.g. split/1/big-csv-file.csv, split/2/big-csv-file.csv etc.
Files are split every 100.000 lines, headers are repeated in each file.
