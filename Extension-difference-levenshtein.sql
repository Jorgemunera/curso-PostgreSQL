CREATE EXTENSION fuzzystrmatch;
SELECT levenshtein ('oswaldo','osvaldo');

SELECT difference('oswaldo','osvaldo');
SELECT difference('beard','bird');