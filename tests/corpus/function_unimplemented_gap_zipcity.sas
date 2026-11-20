/* ZIPCITY is in the SAS 9.4 Functions and CALL Routines dictionary but not
   written here (it reads SASHELP.ZIPCODE): an opensas gap, so the run exits 2,
   not 1. It was missing from the first name set, which came from the coverage
   list rather than the dictionary itself.
   expect-rc: 2 */
data _null_;
  c = zipcity('27511');
  put c=;
run;
