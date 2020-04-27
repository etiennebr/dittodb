#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>
#include <testthatAPI.h>

static const R_CallMethodDef CallEntries[] = {
  {"duplicate_",         (DL_FUNC) &duplicate_,         1},
  {"reassign_function",  (DL_FUNC) &reassign_function,  4},
  {NULL, NULL, 0}
};

void R_init_dittodb(DllInfo *dll)
{
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
