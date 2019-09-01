FROM centos
ENV PGDATA=/var/lib/pgsql/10/data/
RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm && yum install postgresql10-server -y
EXPOSE 5432
VOLUME /var/lib/pgsql/10/data
COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh
USER postgres
CMD /docker-entrypoint.sh
