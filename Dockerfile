FROM ubuntu:18.04
MAINTAINER JACOBBIEKER <jacob@bieker.tech>

RUN apt-get clean && apt-get update

# Install wget
RUN apt-get install -y --fix-missing --no-install-recommends wget git ca-certificates libsecret-1-0

# Fix missing library

RUN apt install -y --fix-missing gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

# Install cudo miner
RUN wget --no-check-certificate -O - https://download.cudo.org/keys/pgp/apt.asc > /etc/apt/trusted.gpg.d/cudo.asc && echo -n 'deb [arch=amd64] https://download.cudo.org/repo/apt/ stable main' > /etc/apt/sources.list.d/cudo.list && apt-get update && apt-get install -y --fix-missing cudo-miner-core cudo-miner-service cudo-miner-cli cudo-miner-desktop

CMD /usr/local/bin/CudoMiner
