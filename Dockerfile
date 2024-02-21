FROM alpine:3.19.1

ARG USER='smbv1'
ARG PASS='secret'

# install samba
RUN apk add samba-common-tools samba-client samba-server

# create user
RUN adduser -D -H -s /bin/nologin -u 1000 ${USER}

# add user to root group
RUN echo -ne ""${PASS}"\n"${PASS}"\n" | smbpasswd -a -s ${USER}

COPY smb.conf /etc/samba/smb.conf

EXPOSE 137/tcp
EXPOSE 137/udp

EXPOSE 138/tcp
EXPOSE 138/udp

EXPOSE 139/tcp
EXPOSE 139/udp

EXPOSE 445/tcp
EXPOSE 445/udp

CMD ["smbd", "--foreground", "--debug-stdout", "--no-process-group"]
