#!/bin/bash
/usr/pgsql-10/bin/postgresql-10-check-db-dir ${PGDATA}

if [ $? -gt 0 ]
then 
echo $PGPASS > /var/lib/pgsql/10/pgpass 
/usr/pgsql-10/bin/initdb -U $PGUSER --pwfile=/var/lib/pgsql/10/pgpass
echo "host all  all    0.0.0.0/0  md5" >> /var/lib/pgsql/10/data/pg_hba.conf
echo "listen_addresses='*'" >> /var/lib/pgsql/10/data/postgresql.conf
fi

/usr/pgsql-10/bin/postmaster -D ${PGDATA}
