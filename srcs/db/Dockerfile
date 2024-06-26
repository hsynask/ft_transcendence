# Use a suitable base image with PostgreSQL pre-installed
FROM postgres:13

# Optionally, install additional packages if required
# RUN apt-get update && apt-get install -y <package-name>

# Expose the PostgreSQL port
EXPOSE 5432

ENTRYPOINT ["./tools/postgres.sh"]

CMD ["postgres"]