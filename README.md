# README


# Sistema de gestion  Academica 

sistema personalizado para la Unidad Educativa Calama, haciendo uso de cloud computing 



## Authors

- [@ronalqm](https://www.github.com/ronalqm)


## Features

- Gestion de estudiantes
- Gestion de docentes
- Gestion de aulas, materias y asistencias
- Gestion de comunicados
- Modulo de reportes


## Installation

Primero clona el repositorio
Luego ejecuta el siguiente comando para instalar 

```bash
  bundle install
```

Verificar la configuracion del archivo config/database.yml para la conexion a la base de datos
posteriormente ejecuta las migraciones de la database

```bash
  rails db:migrate
```


carga los datos iniciales

```bash
  rails db:seed
```

Por ultimo ejecuta en el servidor local, usando el siguiente comando

```bash
  rails server
```

Esto iniciará el servidor en http://localhost:3000.

##Versions

* Ruby version 2.5.1.

* Rails version 5.2.8.1

* PumaServer

* PostgreSQL

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* install dependencies npm install

* Run database migrate rails db:migrate

* Run rails on sever rails s
# sisia
