#!/bin/bash
# Found on https://github.com/Roconda/docker-postgres-logging/blob/master/Dockerfile
set -e

sed -ri "s/^#log_statement.*/log_statement = 'all'/g" /var/lib/postgresql/data/postgresql.conf
