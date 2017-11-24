-- This runs first to create the staging DB (look for
-- postgresql_staging in ../docker-compose.yml), before
-- restoring the daily backup.

-- This is actually the production database, but the name is what it is.
CREATE DATABASE gitlabhq_production;

-- The only reasons these are here is so that the daily backup can DROP them
-- without failing.
CREATE ROLE "gitlab";
CREATE ROLE "gitlab-psql";

