#!/bin/sh

if [ ! -d "~/.logs" ]; then
	mkdir "~/.logs";
fi;
# $(stat -c '%u:%g' $(dirname ${LOGDIR})) "${LOGDIR}";

if [ -w "/path/to/dir" ]; then echo "WRITABLE"; else echo "NOT WRITABLE"; fi


export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi';




# ------------------------------------------------------------
#
#	Citation(s)
#
#		atomicobject.com  |  "How (and Why) to Log Your Entire Bash History"  |  https://spin.atomicobject.com/2016/05/28/log-bash-history/
#
#		serverfault.com  |  "Is there a global .bash_profile for all users on a system?"  |  https://serverfault.com/a/627682
#
# ------------------------------------------------------------