dnl --------------------------------------------------------------------------
dnl PA_HAVE_TCPWRAPPERS
dnl
dnl Do we have the tcpwrappers -lwrap?  This can't be done using AC_CHECK_LIBS
dnl due to the need to provide "allow_severity" and "deny_severity" variables
dnl --------------------------------------------------------------------------
AC_DEFUN([PA_HAVE_TCPWRAPPERS],
[AC_CHECK_LIB([wrap], [main])
 AC_MSG_CHECKING([for tcpwrappers])
 AC_LINK_IFELSE([AC_LANG_PROGRAM(
  [[
#include <tcpd.h>
int allow_severity = 0;
int deny_severity = 0;
  ]],
  [[
	hosts_ctl("sample_daemon", STRING_UNKNOWN, STRING_UNKNOWN, STRING_UNKNOWN);
  ]])],
 [
	AC_DEFINE(HAVE_TCPWRAPPERS, 1,
	[Define if we have tcpwrappers (-lwrap) and <tcpd.h>.])
	AC_MSG_RESULT([yes])
 ],
 [
	AC_MSG_RESULT([no])
 ])])
