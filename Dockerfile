FROM mhart/alpine-node:latest

RUN apk add --no-cache xvfb git bash dbus ttf-freefont udev
RUN apk add --no-cache chromium
RUN apk add --no-cache firefox-esr

ENV DISPLAY :99
ENV CHROME_BIN /usr/bin/chromium

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
