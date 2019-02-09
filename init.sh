#!/bin/bash

# start containers
docker-compose up -d

# create DB
echo "Setting up the database..."
docker-compose exec -d web /bin/bash -c "cd /app && rake db:setup"
