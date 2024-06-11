dnl --------------------------------------------------------------------------
dnl PA_SIGSETJMP
dnl
dnl Do we have sigsetjmp/siglongjmp?  (AC_CHECK_FUNCS doesn't seem to work
dnl for these particular functions.)
dnl --------------------------------------------------------------------------
AC_DEFUN([PA_SIGSETJMP],
[AC_MSG_CHECKING([for sigsetjmp])
 AC_LINK_IFELSE([AC_LANG_SOURCE(
[
AC_INCLUDES_DEFAULT
#include <setjmp.h>

int main(void) {
	sigjmp_buf buf;
	if (sigsetjmp(buf,1))
		return 0;
	siglongjmp(buf,2);
	return 1;
  }
])],
 [AC_MSG_RESULT([yes])
  AC_DEFINE([HAVE_SIGSETJMP], 1,
    [Define to 1 if your system has sigsetjmp/siglongjmp])],
 [AC_MSG_RESULT([no])])])
