#Partimos de una imagen debian con systemd
FROM jrei/systemd-debian:10

MAINTAINER javierfp <javierfp@iessanclemente.net>

ENV TERM xterm
ENV PASS=abc123.
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/sbin

LABEL distribucion="Debian 10"
LABEL descripcion="Imagen Debian para proxmox"
LABEL paquetes="vim, iputils-ping, nano, procps wget"
LABEL acceso="usuario: root, password: abc123."

#Copiamos el entrypoint.sh al container
COPY entrypoint.sh /usr/bin/entrypoint.sh

#Damos permiso al entrypoint y al script
RUN set -x; \
	chmod +x /usr/bin/entrypoint.sh

#Establecemos la password de root
RUN set -x; \
	echo "root:$PASS" | chpasswd

#Instalamos paquetes de utilidades
RUN set -x; \
	apt update && apt install -y vim iputils-ping nano procps wget

#Establecemos repositorio para proxmox
RUN set -x; \
	echo "deb http://download.proxmox.com/debian/pve buster pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list

#Obtenemos clave del repositorio
RUN set -x; \
	wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg

#Actualizamos paquetes de instalamos
RUN set -x; \
	apt update && apt install -y proxmox-ve

#Limpiando
RUN set -x; \
	apt clean

#Comando para arrancar ssh y entrar en bucle de espera
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
