#!/bin/sh

/wait-for-it.sh samba:445

source /sh2ju.sh
juLogClean

juLog -name="opentcp" nc -zv -w 10 samba 445
juLog -name="opentcp" nc -zv -w 10 samba 139

