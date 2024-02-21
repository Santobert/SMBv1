# SMBv1

Container with SMBv1 built-in

## docker-compose.yml

```yml
services:
  smbv1:
    image: ghcr.io/santobert/smbv1:main
    volumes:
      - /opt/paperless/consume:/media/consume
    environment:
      - PASS: "smbv1"
    ports:
      - 137:137
      - 138:138
      - 139:139
      - 445:445
    restart: unless-stopped
```
