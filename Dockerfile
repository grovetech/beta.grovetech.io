FROM jekyll/jekyll:pages
FROM ruby:2-alpine3.15

COPY Gemfile* /srv/jekyll/

WORKDIR /srv/jekyll

RUN apk update && \
	apk add ruby-dev gcc make curl build-base libc-dev libffi-dev zlib-dev libxml2-dev libgcrypt-dev libxslt-dev python3

RUN bundle config build.nokogiri --use-system-libraries && \
	bundle install

EXPOSE 4000