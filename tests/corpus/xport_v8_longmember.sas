/* XPORT version 8 stamps a member name of up to 32 chars (here 31) in the
   first descriptor record; a libref pointed at the file serves that member by
   its full name. The file (pyreadstat 1.3.8 write_xport, version 8) also
   carries a 13-char variable name and an E8601DT19. format. */
libname lm xport "tests/corpus/includes/xpt_v8_longmember.xpt";
proc contents data=lm.a_member_name_of_thirty_two_chr; run;
data _null_;
  set lm.a_member_name_of_thirty_two_chr;
  put visitdatetime= arm=;
run;
