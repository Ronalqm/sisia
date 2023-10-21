# Use an official Ruby runtime as a parent image
FROM ruby:2.5.1

# Install dependencies
RUN apt-get update && apt-get install -y nodejs && rm -rf /var/lib/apt/lists/* && apt-get clean

# Selecciona un espejo de Debian diferente
RUN sed -i 's/deb.debian.org/ftp.debian.org/' /etc/apt/sources.list

# Set the working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock into the image
COPY Gemfile Gemfile.lock ./

# Install bundle and dependencies
RUN gem install bundler && bundle install

# Copy the main application
COPY . .

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the application
CMD ["rails", "server", "-b", "0.0.0.0"]
