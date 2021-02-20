FROM ruby:3

RUN mkdir -p /app
WORKDIR /app

RUN apt-get update && apt-get install -y \
  build-essential \
  apt-utils

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Install Yarn (required for Webpacker)
RUN npm install -g yarn
# Set yarn version for the project to 2
RUN yarn set version berry
# Install the javascript dependencies
COPY package.json package.json
RUN yarn install

# Update/install ruby gems
RUN gem update --system
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v "~>2.2" 
RUN bundle update --bundler
RUN bundle update
RUN bundle install

EXPOSE 3000

#CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
