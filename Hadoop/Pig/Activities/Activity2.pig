inputFile = LOAD 'hdfs:///user/root/mamatha/file01.txt' AS (line);
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
grpd = GROUP words BY word;
cntd = FOREACH grpd GENERATE group, COUNT(words);
rmf hdfs:///user/root/mamatha/PigResult;
STORE cntd INTO 'hdfs:///user/root/PigResult';