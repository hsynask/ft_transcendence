# Use a suitable base image with PostgreSQL pre-installed
FROM postgres:13

# Optionally, install additional packages if required
# RUN apt-get update && apt-get install -y <package-name>

# Expose the PostgreSQL port
EXPOSE 5432

WORKDIR /app

COPY ./tools/postgres.sh /app
COPY ./conf/postgresql.conf /etc/postgresql/postgresql.conf

RUN chmod +x /app/postgres.sh

# Start the PostgreSQL server
ENTRYPOINT ["/app/postgres.sh"]

CMD ["postgres"]