FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat-openbsd && \
    ln -s /usr/games/cowsay /usr/bin/cowsay && \
    ln -s /usr/games/fortune /usr/bin/fortune

WORKDIR /app

COPY . .

RUN sed -i 's/\r$//' wisecow.sh
RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]