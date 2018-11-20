FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /yellowpages/backend
WORKDIR /yellowpages/backend
COPY Gemfile /yellowpages/backend/Gemfile
COPY Gemfile.lock /yellowpages/backend/Gemfile.lock
RUN bundle install
#RUN bundle install --jobs 20 --retry 5 --without development test
COPY . /yellowpages/backend

