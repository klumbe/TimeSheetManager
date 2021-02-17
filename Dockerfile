FROM ruby:2.6.1

RUN apt-get update && apt-get install -y \
  build-essential \
  apt-utils

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

# Install Yarn (required for Webpacker)
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

RUN mkdir -p /app
WORKDIR /app

RUN gem update --system
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 1.17.3 && bundle install

EXPOSE 3000

#CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
