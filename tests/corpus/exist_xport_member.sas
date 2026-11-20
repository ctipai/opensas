/* EXIST on a libref pointed at one transport file: the file holds ONE member,
   so only its stamped name exists. A missing file is 0; the stamped member is
   1; any other member name is 0, as SET of that name fails (it answered 1).
   Both the %SYSFUNC and the DATA step route. */
libname gone xport "tests/corpus/includes/no_such_transport.xpt";
libname here xport "tests/corpus/includes/xpt_v8_pair.xpt";
%let a = %sysfunc(exist(gone.pair));
%let b = %sysfunc(exist(here.pair));
%let c = %sysfunc(exist(here.nope));
data _null_;
  d = exist('gone.pair');
  e = exist('here.pair');
  f = exist('here.nope');
  put "sysfunc missing-file=&a present=&b wrong-member=&c";
  put "datastep missing-file=" d "present=" e "wrong-member=" f;
run;
