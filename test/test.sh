#!/bin/sh

/wait-for-it.sh samba:445

source /sh2ju.sh
juLogClean

juLog -name="opentcp" nc -zv -w 10 samba 445
juLog -name="opentcp" nc -zv -w 10 samba 139
juLog -name="vol1" smbclient -N //samba/vol1 -c ls
juLog -name="vol2" smbclient -N //samba/vol2 -c ls

