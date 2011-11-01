#
# Regular cron jobs for the acdt package
#
0 4	* * *	root	[ -x /usr/bin/acdt_maintenance ] && /usr/bin/acdt_maintenance
