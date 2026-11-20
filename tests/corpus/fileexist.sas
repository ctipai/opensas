/* FILEEXIST(physical-name): 1 when the external file exists, 0 when it does
   not (Functions ref "FILEEXIST Function"); a directory counts as existing
   (UNIX and Windows companions). Paths are relative to the run's cwd, the
   repository root, as INFILE and LIBNAME paths are. Both the DATA step and the
   %SYSFUNC route are checked, and a padded char variable still matches. */
%let fx = %sysfunc(fileexist(tests/corpus/includes/pc_one.xpt));
%let fn = %sysfunc(fileexist(tests/corpus/includes/no_such_file.xpt));
%macro pick(f);%if %sysfunc(fileexist(&f)) %then use;%else none;%mend;
data _null_;
  length p $ 60;
  put "sysfunc: fx=&fx fn=&fn two=%pick(tests/corpus/includes/pc_two.xpt) three=%pick(tests/corpus/includes/pc_three.xpt)";
  x = fileexist('tests/corpus/includes/pc_ae.xpt');    /* transport file -> 1 */
  s = fileexist('tests/programs/sas7bdat_read/inputs/te.sas7bdat'); /* -> 1 */
  m = fileexist('tests/corpus/includes/nope.sas7bdat'); /* missing -> 0 */
  d = fileexist('tests/corpus/includes');               /* directory -> 1 */
  p = 'tests/corpus/includes/pc_one.xpt';               /* padded to $60 */
  v = fileexist(p);                                     /* -> 1 */
  b = fileexist(' ');                                   /* blank name -> 0 */
  put x= s= m= d= v= b=;
run;
