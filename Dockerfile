# Use the official Ruby image
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs \
  yarn \
  sqlite3 \
  postgresql-client

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install bundler and all gems
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the application code
COPY . ./

# Expose port 3000 and start the Rails server
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
