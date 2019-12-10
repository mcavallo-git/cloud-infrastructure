#!/bin/sh
#
# SH_PATH="/etc/profile.d/path_var.sh" && echo "" > "${SH_PATH}" && vi "${SH_PATH}" && chmod 0644 "${SH_PATH}" && chown root:root "${SH_PATH}";
#
# ------------------------------------------------------------

if [ -v PROFILE ] && [ -n "${PROFILE}" ]; then

	IN="bla@some.com;john@home.com"
	arrIN=(${IN//;/ })
	

fi;

# ------------------------------------------------------------
#
#	Citation(s)
#
#		serverfault.com  |  "Where does the bash PATH on CentOS 7 get /usr/local/bin from?"  |  https://serverfault.com/a/838552
#
#		stackoverflow.com  |  "How do I split a string on a delimiter in Bash?"  |  https://stackoverflow.com/a/5257398
# 
# ------------------------------------------------------------