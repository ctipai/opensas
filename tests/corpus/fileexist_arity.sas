/* FILEEXIST takes exactly one argument; two is the user's error, which aborts
   the step the way any wrong-arity call does (rc 1, not an opensas gap).
   expect-rc: 1 */
data _null_;
  x = fileexist('tests/corpus/includes', 'extra');
  put x=;
run;
