FROM ruby:2.5 as build-and-run

WORKDIR /app
EXPOSE 8080

COPY . /app
RUN bundle install

CMD ["bundle", "exec", "rackup", "-p", "8080", "-o", "0.0.0.0", "-s", "puma"]
