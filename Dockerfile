
FROM ruby:3.1.0
RUN apt-get update -qq && apt-get install -y nano nodejs postgresql-client
ENV TZ Asia/Tokyo
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

COPY . /myapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

ARG MASTER_KEY
ENV RAILS_MASTER_KEY=${MASTER_KEY}

EXPOSE 3000

# ENV RAILS_ENV=production
CMD ["rails", "server", "-b", "0.0.0.0", "RAILS_ENV=production"]
