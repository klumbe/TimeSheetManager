#!/bin/bash
sudo docker-compose up -d 
sudo docker-compose exec web /bin/bash -c "yarn install"
