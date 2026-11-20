/* The %SYSFUNC route classifies an unwritten SAS function the same way as the
   DATA step does (D-009: the same error condition has the same rc on every
   path): FEXIST is a real SAS 9.4 function, so the run exits 2.
   expect-rc: 2 */
data _null_;
  put 'before';
run;
%let r = %sysfunc(fexist(myref));
