#Partimos de una imagen de nfs
FROM erichough/nfs-server

MAINTAINER javierfp <javierfp@iessanclemente.net>

ENV TERM xterm
ENV PASS=abc123.
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/sbin

LABEL acceso="usuario: root, password: abc123."

#Establecemos la password de root
RUN set -x; \
	echo "root:$PASS" | chpasswd

#Copiamos el archivo de exports
COPY exports /etc/exports

#Comando para arrancar ssh y entrar en bucle de espera
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
