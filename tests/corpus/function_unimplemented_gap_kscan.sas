/* KSCAN is documented in the SAS 9.4 NLS Reference Guide, not the Functions
   dictionary; it is still valid SAS 9.4 that opensas has not written, so the
   run exits 2.
   expect-rc: 2 */
data _null_;
  w = kscan('a b c', 2);
  put w=;
run;
