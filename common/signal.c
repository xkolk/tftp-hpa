/*
 * signal.c
 *
 * Use sigaction() to simulate BSD signal()
 */

#include "config.h"

#ifdef HAVE_SIGACTION

sighandler_t tftp_signal(int signum, sighandler_t handler)
{
    struct sigaction action, oldaction;

    memset(&action, 0, sizeof action);
    action.sa_handler = handler;
    sigemptyset(&action.sa_mask);
    sigaddset(&action.sa_mask, signum);
    action.sa_flags = SA_RESTART;

    if (sigaction(signum, &action, &oldaction))
	return SIG_ERR;

    return oldaction.sa_handler;
}

#elif defined(HAVE_BSD_SIGNAL)

sighandler_t tftp_signal(int signum, sighandler_t handler)
{
    return bsd_signal(signum, handler);
}

#else

/* This is dangerous at best. Let's hope it works. */
sighandler_t tftp_signal(int signum, sighandler_t handler)
{
    return signal(signum, handler);
}

#endif
