#!/bin/bash

# start containers
docker-compose up -d

# create DB
echo "Creating the database..."
docker-compose exec -d web /bin/bash -c "cd /app && rake db:create"

# migrate DB
echo "Migrating database..."
docker-compose exec -d web /bin/bash -c "cd /app && rake db:migrate"
