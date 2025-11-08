FROM eclipse-temurin:22-alpine

RUN apk --no-cache add curl jq bash wget

RUN wget https://github.com/FTBTeam/FTB-Server-Installer/releases/latest/download/ftb-server-linux-amd64 -O /usr/local/bin/ftb-server-installer && \
    chmod +x /usr/local/bin/ftb-server-installer