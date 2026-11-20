/* A name no SAS 9.4 reference lists (a misspelling of FILEEXIST) is the user's
   error, not an opensas gap: the run exits 1 ("fix your program").
   expect-rc: 1 */
data _null_;
  y = filexist('tests/corpus/includes');
  put y=;
run;
