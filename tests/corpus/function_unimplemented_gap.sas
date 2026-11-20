/* A function the SAS 9.4 Functions reference names but opensas has not written
   (FEXIST, which checks a fileref) is valid SAS this interpreter cannot run: an
   opensas gap, so the run exits 2 ("file an opensas issue"), not 1 ("fix your
   program"). The call yields missing and the step finishes, as before.
   expect-rc: 2 */
data _null_;
  y = fexist('myref');
  put y=;
run;
