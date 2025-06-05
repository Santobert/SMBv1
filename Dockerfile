FROM alpine:3.22.0

ARG USER="maxify"
ENV USER=${USER}

# install samba
RUN apk add samba-common-tools samba-client samba-server

# create user
RUN adduser -D -s /bin/nologin -u 1000 ${USER}

COPY smb.conf /etc/samba/smb.conf

RUN mkdir -p /opt/smbv1
COPY entrypoint.sh /opt/smbv1/entrypoint.sh
RUN chmod +x /opt/smbv1/entrypoint.sh

WORKDIR /opt/smbv1

EXPOSE 137/tcp
EXPOSE 137/udp

EXPOSE 138/tcp
EXPOSE 138/udp

EXPOSE 139/tcp
EXPOSE 139/udp

EXPOSE 445/tcp
EXPOSE 445/udp

CMD /opt/smbv1/entrypoint.sh
