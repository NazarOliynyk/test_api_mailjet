# The "builder" image will build nokogiri
FROM ruby:2.6.2-alpine AS builder

# Nokogiri's build dependencies
RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev

RUN mkdir /mailjet_tests
WORKDIR /mailjet_tests
COPY Gemfile /mailjet_tests/Gemfile
COPY Gemfile.lock /mailjet_tests/Gemfile.lock
RUN gem install bundler -v $(tail -n 1 Gemfile.lock | xargs) && \
    bundle config build.nokogiri --use-system-libraries && \
    bundle install
COPY . /mailjet_tests

RUN gem install cucumber
RUN bundle install

CMD rake

#docker build -t rubymailjet1:mailjettag1 .
#docker image ls

#docker run  8ceef3282ea7
#docker container ls

#docker tag c4a1d77967bc nazarlw/mailjet_1:tag1
#docker push nazarlw/mailjet_1:tag1

#docker pull nazarlw/mailjet_1:tag1

