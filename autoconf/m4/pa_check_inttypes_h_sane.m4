dnl ------------------------------------------------------------------------
dnl  PA_CHECK_INTTYPES_H_SANE
dnl
dnl  At least some versions of AIX 4 have <inttypes.h> macros which are
dnl  completely broken.  Try to detect those.
dnl --------------------------------------------------------------------------
AC_DEFUN([PA_CHECK_INTTYPES_H_SANE],
[AC_CHECK_HEADERS_ONCE(inttypes.h)
AS_IF([test "x$ac_cv_header_inttypes_h" = xyes],[
  AC_MSG_CHECKING([if inttypes.h is sane])
  AC_LINK_IFELSE([AC_LANG_PROGRAM([AC_INCLUDES_DEFAULT],
  [uintmax_t max = UINTMAX_C(0);
   printf("%"PRIuMAX"\n", max);])],
  [AC_MSG_RESULT([yes])
   AC_DEFINE(INTTYPES_H_IS_SANE, 1,
     [Define if the macros in <inttypes.h> are usable])],
  [AC_MSG_RESULT([no (AIX, eh?)])])])])
