dnl --------------------------------------------------------------------------
dnl  PA_SEARCH_LIBS_AND_ADD
dnl
dnl  PA_SEARCH_LIBS_AND_ADD(function, libraries [,function to add])
dnl --------------------------------------------------------------------------
AC_DEFUN([PA_SEARCH_LIBS_AND_ADD],
 [
  AH_TEMPLATE(AS_TR_CPP(HAVE_$1), [Define if $1 function was found])
  AC_SEARCH_LIBS($1, $2,
   [
    AC_DEFINE_UNQUOTED(AS_TR_CPP(HAVE_$1))
    pa_add_$1=false;
   ],
   [
    XTRA=true;
    if test $# -eq 3; then
      AC_LIBOBJ($3)
    else
      AC_LIBOBJ($1)
    fi
    pa_add_$1=true;
   ])])
