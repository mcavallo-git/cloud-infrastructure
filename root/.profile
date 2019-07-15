# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.
# See /usr/share/doc/bash/examples/startup-files for examples.
# The files are located in the bash-doc package.
#
# The default umask is set in /etc/profile; for setting the umask
# For ssh logins, install and configure the libpam-umask package.
#umask 022

# If connected session is running Bash
if [ -n "${BASH_VERSION}" ]; then

	# If environment variable ${HOME} is set as-intended...
	if [ -n "${HOME}" ] && [ -d "${HOME}" ]; then
		# Run "~/.bashrc" upon logging-in (if it exists)
		if [ -f "${HOME}/.bashrc" ]; [ -f "${HOME}/.bashrc" ]; then
			. "${HOME}/.bashrc";
		fi;

		# Set ${HOME} as default directory upon logging-in
		cd "${HOME}";

	fi;

	# Set 'Vim' as default text-editor (if it exists)
	#  |--> avoids using 'Nano' for commands such as [ crontab -e ], etc.
	if [ -n "$(which vim)" ] && [ -f "$(which vim)" ]; then
		export EDITOR=vim;
		export VISUAL=vim;
	fi;

fi;

# Append PATH with the User's private bin directories
PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}";
