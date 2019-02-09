# TimeSheetManager
Ruby on Rails application to track working hours.

## Installation
The application ships with docker files to minimize configuration-efforts.

1. Install docker according to the official docker docs:
https://docs.docker.com/install/

2. Build and start both the web-application and the PostgreSQL-server:

```
# navigate to the applications folder
cd /"your_path"/TimeSheetManager

# start containers and init the database
sudo ./init.sh
```

3. The application is now available under http://localhost:3000/

