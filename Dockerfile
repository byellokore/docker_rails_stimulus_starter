FROM ruby:2.6.3

LABEL maintener="gabriel@byel.dev"

RUN apt-get update -yqq
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -yqq nodejs
RUN npm install -yqq --global yarn

COPY Gemfile* /usr/src/app/   
WORKDIR /usr/src/app
RUN npm install yarn -g
RUN gem update
RUN bundle install
COPY . /usr/src/app/
CMD ["rails", "s", "-b", "0.0.0.0"]