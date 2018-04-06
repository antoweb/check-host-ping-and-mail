#!/bin/bash

host="<IP ADDRESS OR FQDN>"

# email report when
SUBJECTKO="PING KO...."
SUBJECTOK="PING OK...."
EMAILID="<MAIL ADDRESS TO>"
PINGLOG=ping_result.log

if ping -c 1 $host > $PINGLOG 2>&1
then
 echo "PING OK"
 mail -s "$SUBJECTOK" -r $EMAILID $EMAILID < $PINGLOG
else
 echo "Host : $host is down (ping failed) at $(date)" > $PINGLOG 2>&1
 mail -s "$SUBJECTKO" -r $EMAILID $EMAILID < $PINGLOG
fi
