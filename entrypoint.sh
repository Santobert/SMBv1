#! /bin/sh

echo -ne ""${PASS}"\n"${PASS}"\n" | smbpasswd -a -s ${USER}
smbd --foreground --debug-stdout --no-process-group
