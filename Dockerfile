FROM kadadev/node-small:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --no-cache xvfb dbus ttf-freefont udev openjdk8-jre-base
RUN apk add --no-cache chromium chromium-chromedriver
RUN apk add --no-cache firefox

ENV DISPLAY :99
ENV CHROME_BIN /usr/bin/chromium

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
