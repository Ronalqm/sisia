# Usa la imagen oficial de Ruby con la versión 2.5.1
FROM ruby:2.5.1

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el Gemfile y el Gemfile.lock al contenedor
COPY Gemfile Gemfile.lock ./

# Instala una versión compatible de Bundler
RUN gem install bundler -v '2.3.27'

# Verifica la versión de Bundler
RUN bundler -v

# Instala las gemas
RUN bundle install

# Copia el resto de la aplicación al contenedor
COPY . .

# Exponer el puerto 3000 para la aplicación Rails
EXPOSE 3000

# Comando para iniciar la aplicación Rails
CMD ["rails", "server", "-b", "0.0.0.0"]