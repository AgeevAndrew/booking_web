#!/bin/sh

FOLDER='tmp'
DATE=$(date +%Y-%m-%d_%H-%M)

echo "Backup begin: $DATE" >> $FOLDER/backup.log

pg_dump -v -Z9 -Fc -h 92.53.69.72 -U booker booking_web -f $FOLDER/booking-$DATE.sql
pg_restore -v -c --dbname=booking_web_development -U postgres $FOLDER/booking-$DATE.sql

# pg_dump -v -Z9 -Fc -h 95.213.247.4 -U ksazd raoesv -f $FOLDER/raoesv-$DATE.sql
# pg_restore -v -c --dbname=raoesv -U postgres $FOLDER/raoesv-$DATE.sql
