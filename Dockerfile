FROM ruby:2.6

RUN mkdir /etm
WORKDIR /etm

COPY . .

RUN gem install bundler:2.0.2
RUN bundle install


LABEL maintainer="Hassan Mahmoud <hassantc.mahmoud@gmail.com>"

CMD bin/run