# https://cadu.dev/creating-a-docker-image-with-database-preloaded/
# https://github.com/pthom/northwind_psql/blob/master/northwind.sql

FROM postgres:14.2-alpine as dumper
COPY northwind.sql /docker-entrypoint-initdb.d/

RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV PGDATA=/data

RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]

# final build stage
FROM postgres:14.2-alpine

COPY --from=dumper /data $PGDATA