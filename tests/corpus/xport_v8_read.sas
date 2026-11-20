/* XPORT version 8 read. includes/xpt_v8_pair.xpt and includes/xpt_v5_pair.xpt
   hold the same 3-row table, written by an independent implementation
   (ReadStat, through pyreadstat 1.3.8 write_xport with file_format_version 8
   and 5). The v8 copy has a 16-char name (LONGVARIABLENAME), its 56-char label
   (from the LABELV8 section), a 230-byte char variable, numeric missings and a
   data set label. The v5 copy has the same data under the 8-char name LONGVARI
   and the label cut to 40. Both are printed (contents, then every value), then
   PROC COMPARE on the values after the rename. */
libname v8 xport "tests/corpus/includes/xpt_v8_pair.xpt";
libname v5 xport "tests/corpus/includes/xpt_v5_pair.xpt";
data a8; set v8.pair; run;
data a5; set v5.pair; run;
proc contents data=v8.pair; run;
proc contents data=v5.pair; run;
data _null_;
  set a8;
  n = length(note);
  put usubjid= longvariablename= age= n=;
run;
data _null_;
  set a5;
  n = length(note);
  put usubjid= longvari= age= n=;
run;
data b5; set a5; rename longvari=longvariablename; run;
proc compare base=b5 compare=a8;
run;
