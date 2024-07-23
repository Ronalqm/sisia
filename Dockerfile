# Usa la imagen oficial de Ruby con la versión 2.5.1
FROM ruby:2.5.1

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

# Exponer el puerto 3000 para la aplicación Rails
EXPOSE 3000

# Comando para iniciar la aplicación Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
