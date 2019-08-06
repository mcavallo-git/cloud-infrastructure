#!/bin/sh
#
# SH_PATH="/etc/profile.d/bash_history_logging.sh" && echo "" > "${SH_PATH}" && vi "${SH_PATH}" && chmod 0644 "${SH_PATH}" && chown root:root "${SH_PATH}";
#
# ------------------------------------------------------------

# Resolve current user's home-directory
if [ -n "${HOME}" ]; then
	USER_HOMEDIR="${HOME}";

elif [ -n "$(which getent;)" ] && [ -n "$(getent passwd $(whoami) | cut --delimiter=: --fields=6;)" ]; then
	USER_HOMEDIR="$(getent passwd $(whoami) | cut --delimiter=: --fields=6;)";

elif [ -n "$(which realpath;)" ] && [ -n "$(realpath ~;)" ]; then
	USER_HOMEDIR="$(realpath ~)";

elif [ -n "$(which readlink;)" ] && [ -n "$(readlink -f ~;)" ]; then
	USER_HOMEDIR="$(readlink -f ~)";

fi;

if [ -n "${USER_HOMEDIR}" ]; then

	# Define the fullpath for the log-directory
	BASH_LOGDIR="${USER_HOMEDIR}/.bash-logs";
	echo "BASH_LOGDIR=${BASH_LOGDIR}";

	# Define the fullpath for the log-file
	BASH_LOGFILE="${BASH_LOGDIR}/bash-log.$(id -un).$(date +'%Y-%m-%d').log";
	
	# Ensure the log-directory exists (create it if it doesn't)
	if [ ! -d "${BASH_LOGDIR}" ] && [ -w "${USER_HOMEDIR}/" ]; then
		mkdir -p "${BASH_LOGDIR}";
	fi;

	if [ -d "${BASH_LOGDIR}" ] && [ -w "${BASH_LOGDIR}" ]; then

		# Set user:group ownership for the log-directory to be the current-user && their default-group
		if [ -n "$(which stat;)" ] && [ "$(stat -c '%u:%g' ${BASH_LOGDIR})" != "$(id --user):$(id --group)" ]; then
			chown -R "$(id -u):$(id -g)" "${BASH_LOGDIR}";
		fi;

		# Limit access to bash-logs on a per-user basis (block read-access from users who aren't the owner)
		if [ -n "$(which stat;)" ] && [ "$(stat --format '%a' ${BASH_LOGDIR})" != "700" ]; then
			chmod -R 700 "${BASH_LOGDIR}";
		fi;

		# Create the logfile for this session (skip this step if it exists, already)
		if [ ! -f "${BASH_LOGFILE}" ]; then
			echo -n "" > "${BASH_LOGFILE}";
			chmod 600 "${BASH_LOGFILE}";
		fi;

		# Log the current bash-command to the user's logs-directory as-intended
		if [ -n "$(which sed)" ]; then
			HISTORY_FORMAT_PIPE=" | sed 's/^ *[0-9]* *//'";
		elif [ -n "$(which cut)" ]; then
			HISTORY_FORMAT_PIPE=" | cut -c 8-";
		else
			HISTORY_FORMAT_PIPE="";
		fi;
		export PROMPT_COMMAND="echo \"\$(date \"+%Y-%m-%d.%H:%M:%S\") \$(pwd) \$(history 1${HISTORY_FORMAT_PIPE})\" >> \"${BASH_LOGFILE}\";";


		# Limit access to bash-logs on a per-user basis (block read-access from users who aren't the owner)
		if [ -n "$(which stat;)" ] && [ "$(stat --format '%a' ${BASH_LOGFILE})" != "600" ]; then
			chmod 600 "${BASH_LOGFILE}";
		fi;

	fi;

fi;

# ------------------------------------------------------------
#
#	Citation(s)
#
#		atomicobject.com  |  "How (and Why) to Log Your Entire Bash History"  |  https://spin.atomicobject.com/2016/05/28/log-bash-history/
#
#		serverfault.com  |  "Is there a global .bash_profile for all users on a system?"  |  https://serverfault.com/a/627682
#
#		stackoverflow.com  |  "Bash history without line numbers"  |  https://stackoverflow.com/a/7110197
#
# ------------------------------------------------------------