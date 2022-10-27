FROM ruby:3.1.2-alpine

RUN apk add --update --no-cache  --virtual run-dependencies \
build-base \
postgresql-client \
postgresql-dev \
yarn \
git \
tzdata \
libpq \
&& rm -rf /var/cache/apk/*

RUN mkdir /docker-testing
WORKDIR /docker-testing

ENV BUNDLE_PATH /gems

COPY package.json yarn.lock /docker-testing/
RUN yarn install
COPY Gemfile Gemfile.lock /docker-testing/
RUN bundle install

COPY . /docker-testing/

CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000