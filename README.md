E-Wallet API
============

Instalación de ambiente de desarrollo
---

### Instalar RVM
RVM te permite instalar y mantener varias versiones de ruby a la vez. Para instalar RVM con Ruby se ejecuta el comando:
>     \curl -sSL https://get.rvm.io | bash -s stable --ruby


### Instalación de Ruby

Instalar ruby 2.5.1
>     $ rvm install 2.5.1

Definir ruby
>     $ rvm use 2.5.1


### Instalar Homebrew

Homebrew instala todo aquello que necesitas que Apple no instala de serie.
Para instalar, ejecutar el siguiente comando:
>     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


### Instalar Git

Para instalar usando Homebrew ejecutar el siguiente comando:
>     brew install git


### Clonar este proyecto con Git

Para obtener la copia de este repositorio ejecuta el siguiente comando:
>     $ git clone git@github.com:alanchavezgar/ewallet-api.git


### Instalar y configurar la base de datos

Instala PostgreSQL usando Homebrew
>     brew install postgresql

o descarga e instala [Postgres.app](https://postgresapp.com)


#### Configurar la conexión a la base de datos.

Es necesario crear al archivo **/config/database.yml** con los parámetros de acceso.

Ejemplo:
```yaml
host: localhost
database: <NOMBRE_BD>
username: <USUARIO>
password: <PASSWORD>
```

Ingresa a postgresql y crea el usuario con los mismos parametros del archivo de configuración
de la base de datos y con permisos para hacer login y crear bases de datos.
```sql
$ psql
> CREATE USER <USUARIO> WITH PASSWORD <PASSWORD> LOGIN CREATEDB;
```

### Instalar dependencias (Gemas)

Para instalar las gemas usaremos Bundler.

Ejecuta el siguiente comando:
>     $ gem install bundler

Con bundler podemos instalar las demás dependencias de nuestro proyecto, ejecuta el siguiente comando:
>     $ bundle install


### Ejecutar proyecto
Antes de poder ejecutar el proyecto necesitas crear las bases de datos:
>     $ rake db:create

y migrarlas
>     $ rake db:migrate

Ejecuta el proyecto con:
>     rails s

### Guard
Guard automatiza una variedad de tareas ejecutando reglas personalizadas cada vez que se modifica un archivo o un directorio.

Para iniciar Guard... sí, adivinaste, ejecuta el siguiente comando:
>     $ bundle exec guard


## Funcionamiento de la API
Se recomienda utilizar [HTTPie](https://httpie.org)

Instálalo con el siguiente comando:
>     $ brew install httpie


### Usuario

Crea un usuario:
>     $ http POST :3000/sistema/signup nombre="Nombre" email=nombre@correo.com password=un_password password_confirmation=un_password

Obten tu token de autenticación:
>     $ http POST :3000/login email=nombre@correo.com password=un_password

Con el token de autenticación puedes consultar el balance de tu wallet y tu numero de cuenta:
>     $ http GET :3000/sistema/mi_cuenta \
>     > Authorization:"eyJhbGciOiJIUzI1NiJ9.eyJ1c3VhcmlvX2lkIjoyLCJleHAiOjE1MzQyMDkwMDJ9.jAv8mce0LIZGTRGubvIfJOapeFZ02CFjPTcYwCV80wg"


### Deposito

Para fondear tu wallet:
>     $ http POST :3000/finanzas/depositos monto="5000.50" numero_tarjeta=1234567812345678 \
>     > Authorization:"eyJhbGciOiJIUzI1NiJ9.eyJ1c3VhcmlvX2lkIjoyLCJleHAiOjE1MzQyMDkwMDJ9.jAv8mce0LIZGTRGubvIfJOapeFZ02CFjPTcYwCV80wg"

Ver todos tus depositos:
>     $ http GET :3000/finanzas/depositos \
>     > Authorization:"eyJhbGciOiJIUzI1NiJ9.eyJ1c3VhcmlvX2lkIjoyLCJleHAiOjE1MzQyMDkwMDJ9.jAv8mce0LIZGTRGubvIfJOapeFZ02CFjPTcYwCV80wg"


### Retiro

Para retirar fondos de tu wallet:
>     $ http POST :3000/finanzas/retiros monto="1000" numero_tarjeta=1234567812345678 \
>     > Authorization:"eyJhbGciOiJIUzI1NiJ9.eyJ1c3VhcmlvX2lkIjoyLCJleHAiOjE1MzQyMDkwMDJ9.jAv8mce0LIZGTRGubvIfJOapeFZ02CFjPTcYwCV80wg"

Ver todos tus retiros:
>     $ http GET :3000/finanzas/retiros \
>     > Authorization:"eyJhbGciOiJIUzI1NiJ9.eyJ1c3VhcmlvX2lkIjoyLCJleHAiOjE1MzQyMDkwMDJ9.jAv8mce0LIZGTRGubvIfJOapeFZ02CFjPTcYwCV80wg"


### Transferencias

Para transferir fondos de tu wallet a otra cuenta:
>     $ http POST :3000/finanzas/transferencias monto="1000" numero_cuenta=1234567812345678 \
>     > Authorization:"eyJhbGciOiJIUzI1NiJ9.eyJ1c3VhcmlvX2lkIjoyLCJleHAiOjE1MzQyMDkwMDJ9.jAv8mce0LIZGTRGubvIfJOapeFZ02CFjPTcYwCV80wg"

Ver todas tus transferencias:
>     $ http GET :3000/finanzas/retiros \
>     > Authorization:"eyJhbGciOiJIUzI1NiJ9.eyJ1c3VhcmlvX2lkIjoyLCJleHAiOjE1MzQyMDkwMDJ9.jAv8mce0LIZGTRGubvIfJOapeFZ02CFjPTcYwCV80wg"
