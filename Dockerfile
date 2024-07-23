# Usa una imagen base de Debian Buster
FROM debian:buster

# Instala dependencias y Ruby 2.5.1 manualmente
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  curl \
  git \
  libssl-dev \
  libreadline-dev \
  zlib1g-dev \
  libpq-dev \
  && rm -rf /var/lib/apt/lists/*

# Instala rbenv y ruby-build
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN ~/.rbenv/bin/rbenv install 2.5.1
RUN ~/.rbenv/bin/rbenv global 2.5.1

# Agrega rbenv al PATH
ENV PATH="/root/.rbenv/bin:/root/.rbenv/shims:${PATH}"

# Verifica la versión de Ruby
RUN ruby -v

# Instala Node.js y npm
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el Gemfile y el Gemfile.lock al contenedor
COPY Gemfile Gemfile.lock ./

# Elimina todas las versiones de Bundler para evitar conflictos
RUN gem uninstall bundler --all --executables || true

# Instala una versión específica de Bundler
RUN gem install bundler:2.2.3

# Establece la versión de Bundler explícitamente
ENV BUNDLER_VERSION=2.2.3

# Verifica la versión de Bundler
RUN bundle _2.2.3_ --version

# Instala las gemas usando la versión correcta de Bundler
RUN bundle _2.2.3_ install

# Copia el resto de la aplicación al contenedor
COPY . .

# Instala dependencias JavaScript si tienes un package.json
COPY package.json ./
RUN npm install

# Exponer el puerto 3000 para la aplicación Rails
EXPOSE 3000

# Comando para iniciar la aplicación Rails
CMD ["rails", "server", "-b", "0.0.0.0"]