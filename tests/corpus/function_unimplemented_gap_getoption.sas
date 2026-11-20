/* GETOPTION is documented in the SAS 9.4 System Options reference, not the
   Functions dictionary; opensas has not written it, so %SYSFUNC(GETOPTION(...))
   is an opensas gap and the run exits 2, not 1.
   expect-rc: 2 */
data _null_;
  put 'before';
run;
%let o = %sysfunc(getoption(linesize));
