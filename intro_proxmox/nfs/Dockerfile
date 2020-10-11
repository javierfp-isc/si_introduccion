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
