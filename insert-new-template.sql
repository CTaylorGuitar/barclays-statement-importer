CREATE TEMPORARY TABLE `bank_statement_entries_temp`
LIKE `bank_statement_entries`;

LOAD DATA LOCAL INFILE 'csv-filepath'
INTO TABLE `bank_statement_entries_temp`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@col1, @col2, @col3, @col4, @col5, @col6) SET
cheque_id=@col1,
date=str_to_date(@col2, '%d/%m/%Y'),
amount=@col4,
subcategory=@col5,
memo=@col6;

INSERT INTO `bank_statement_entries` (
    `cheque_id`,
    `date`,
    `amount`,
    `subcategory`,
    `memo`
) SELECT
    `cheque_id`,
    `date`,
    `amount`,
    `subcategory`,
    `memo`
FROM `bank_statement_entries_temp`
ORDER BY `id` DESC;
