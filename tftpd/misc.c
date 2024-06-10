/* ----------------------------------------------------------------------- *
 *
 *   Copyright 2001-2007 H. Peter Anvin - All Rights Reserved
 *
 *   This program is free software available under the same license
 *   as the "OpenBSD" operating system, distributed at
 *   http://www.openbsd.org/.
 *
 * ----------------------------------------------------------------------- */

/*
 * misc.c
 *
 * Minor help routines.
 */

#include "config.h"             /* Must be included first! */
#include <syslog.h>
#include "tftpd.h"

/*
 * Set the signal handler and flags, and error out on failure.
 */
void set_signal(int signum, sighandler_t handler, int flags)
{
    if (tftp_signal(signum, handler, flags)) {
        syslog(LOG_ERR, "sigaction: %m");
        exit(EX_OSERR);
    }
}

/*
 * malloc() that syslogs an error message and bails if it fails.
 */
void *tfmalloc(size_t size)
{
    void *p = malloc(size);

    if (!p) {
        syslog(LOG_ERR, "malloc: %m");
        exit(EX_OSERR);
    }

    return p;
}

/*
 * strdup() that does the equivalent
 */
char *tfstrdup(const char *str)
{
    char *p = strdup(str);

    if (!p) {
        syslog(LOG_ERR, "strdup: %m");
        exit(EX_OSERR);
    }

    return p;
}
