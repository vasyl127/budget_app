#!/bin/bash

# variables
export DATABASE_URL="postgres://postgres:<obfuscated>@postgres:5432/budget_app_production"

echo $(date +"%Y-%m-%d %T"): START replay database backup

# get a dump of database
echo $(date +"%Y-%m-%d %T"): Dump the database

pg_dump --dbname=$DATABASE_URL | gzip > /db_backups/budget_app_production-$(date +%d%m%Y_%T).psql.gz


# remove all but 5 latest backups
echo $(date +"%Y-%m-%d %T"): Remove old backups
ls -1trd /db_backups/* | head -n -5 | xargs rm -f

echo $(date +"%Y-%m-%d %T"): END replay database backup
echo "************************************************************"