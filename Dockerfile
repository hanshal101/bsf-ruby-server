# Use an Alpine-based Ruby image
FROM index.docker.io/library/ruby:3.1-alpine@sha256:f9c75043ce289b61cebdd0a16851d5ae68d82bfb912eb7d6ca4f57cc6780ecef AS build

# Install required dependencies for Ruby gems
RUN apk add --no-cache build-base libxml2-dev libxslt-dev tzdata

# Set the working directory inside the container
WORKDIR /src

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock /src/

# Install the required gems
RUN bundle install

# Copy the rest of the application files to the container
COPY . /src

# Expose the application port
EXPOSE 9898

# Set the environment variable for the port (optional, but good practice)
ENV PORT 9898

# Command to run the Ruby application
CMD ["ruby", "main.rb"]