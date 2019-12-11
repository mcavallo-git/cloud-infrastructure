#!/bin/sh
#
# SH_PATH="/etc/profile.d/required_paths.sh" && echo "" > "${SH_PATH}" && vi "${SH_PATH}" && chmod 0644 "${SH_PATH}" && chown root:root "${SH_PATH}";
#
# ------------------------------------------------------------

if [ -v PATH ] && [ -n "${PATH}" ]; then

	unset REQUIRED_PATHS; declare -a REQUIRED_PATHS; # [Re-]Instantiate bash array
	REQUIRED_PATHS=();
	REQUIRED_PATHS+=("/usr/local/bin");
	REQUIRED_PATHS+=("/usr/local/sbin");

	# Ensure each required path is found within the $PATH variable
	for EACH_REQD_PATH in "${REQUIRED_PATHS[@]}"; do

		PATH_EXISTS=0;
		for EACH_PATH in $(echo $PATH | tr ":" "\n"); do
			if [ "${EACH_PATH}" == "${EACH_REQD_PATH}" ]; then
				PATH_EXISTS=1;
			fi;
		done;

		if [ ${PATH_EXISTS} -eq 0 ]; then
			# echo "Appending string \":${EACH_REQD_PATH}\" to \$PATH";
			PATH="${PATH}:${EACH_REQD_PATH}";
		fi;

	done;

	export PATH;

fi;

# ------------------------------------------------------------
#
#	Citation(s)
#
#   serverfault.com  |  "Where does the bash PATH on CentOS 7 get /usr/local/bin from?"  |  https://serverfault.com/a/838552
#
#   stackoverflow.com  |  "How do I split a string on a delimiter in Bash?"  |  https://stackoverflow.com/a/5257398
#
# ------------------------------------------------------------