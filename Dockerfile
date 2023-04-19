FROM nginx

#Crear un nuevo usuario
RUN useradd aldomar

#Copiar el código al directorio de nginx
COPY page-example /usr/share/nginx/html

#Definimos en el variable de entorno
ENV archivo docker

#Directorio de trabajo
WORKDIR /usr/share/nginx/html

#Exponemos en un puerto
EXPOSE 90

#Agregamos labels
LABEL version = 0.0.1

#Indicamos que el usuario "aldomar" ejecute la tarea, y copiar a una nueva página
RUN echo "Desarrollado por $(whoami)" > /tmp/page-new.html

#Cambiamos al usuario "root"
USER root

#Copiar el archivo "page-new.html" al directorio de nginx
RUN cp /tmp/page-new.html /usr/share/nginx/html/docker.html

#Definimos donde se guardan los logs de nginx para que la data persista
VOLUME /var/log/nginx

CMD nginx -g 'daemon off;'
