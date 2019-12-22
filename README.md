## Purpose
Import Barclays bank csv formatted current account statements into a mysql database.

## Useage
1. Check that column headers are consistent.  
1. Entries in csv files must not overlap but may have gaps if there were no transactions on a particular day.  
1. To run import script:  
`import.sh host port mysql-root-password database path/to/csv`
