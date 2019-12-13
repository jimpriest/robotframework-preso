FROM alpine:latest

RUN apk update && apk upgrade \
  && echo @latest-stable http://nl.alpinelinux.org/alpine/latest-stable/community >> /etc/apk/repositories \
  && echo @latest-stable http://nl.alpinelinux.org/alpine/latest-stable/main >> /etc/apk/repositories \
  && apk add --no-cache \
    chromium@latest-stable \
    chromium-chromedriver@latest-stable \
    python3 \
  && pip3 install robotframework robotframework-seleniumlibrary faker==2.0.1 robotframework-faker==4.2.0 \
  && rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/*

# Add Chrome as a user
RUN mkdir -p /robot \
    && adduser -D chrome \
    && chown -R chrome:chrome /robot
# Run Chrome as non-privileged
USER chrome
WORKDIR /robot

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/
