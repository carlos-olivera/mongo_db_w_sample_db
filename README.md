

# Imagen Docker basado en MongoDB con datos de muestra

Este es un proyecto que contiene una imagen Dockerizada de MongoDB, diseñada para ser fácil de lanzar y utilizar.

El servidor de MongoBD tiene diversas bases de datos para su uso en aprendizaje.

## Prerrequisitos

Asegúrate de tener Docker y Docker Compose instalados en tu sistema. Para verificar que están instalados correctamente, puedes ejecutar los siguientes comandos:

```shell
docker --version
docker-compose --version
```

Si no tienes Docker o Docker Compose, puedes seguir estas guías para instalarlos:

- [Instalar Docker](https://docs.docker.com/get-docker/)
- [Instalar Docker Compose](https://docs.docker.com/compose/install/)

## Despliegue

Una vez que hayas clonado este repositorio y estés dentro del directorio que contiene el archivo `docker-compose.yml`, puedes desplegar el contenedor de MongoDB con los siguientes pasos:

### Construir la Imagen Docker

Para construir la imagen Docker, ejecuta el siguiente comando:

```shell
docker-compose build
```

### Iniciar el Contenedor

Para iniciar el contenedor, ejecuta el siguiente comando:

```shell
docker-compose up
```

## Conexión a MongoDB

Puedes conectarte a la instancia de MongoDB en el contenedor usando el siguiente URI de MongoDB:

```plaintext
mongodb://admin:test@localhost:27017/?authSource=admin&readPreference=primary&appname=MongoDB%20Compass&ssl=false
```

Si estás utilizando MongoDB Compass, puedes pegar este URI en el campo "Connect Using Connection String".

## Contribuciones

¡Apreciamos tus contribuciones! Por favor, siéntete libre de enviar una solicitud de extracción o de abrir un problema si encuentras alguno.
```

