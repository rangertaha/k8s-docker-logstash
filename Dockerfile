FROM quay.io/pires/docker-jre:8u112_1

MAINTAINER rangertaha@gmail.com

# Export HTTP & Transport
EXPOSE 5959 5959

ENV VERSION 5.3.0

# Install Logstash
RUN apk add --update curl bash ca-certificates
RUN \
  ( curl -Lskj https://artifacts.elastic.co/downloads/logstash/logstash-$VERSION.tar.gz | \
  gunzip -c - | tar xf - ) && \
  mv logstash-$VERSION /logstash && \
  rm -rf $(find /logstash | egrep "(\.(exe|bat)$|sigar/.*(dll|winnt|x86-linux|solaris|ia64|freebsd|macosx))") && \
  apk del curl wget

# Logstash config
VOLUME ["/logstash/config"]

# Optional certificates folder
VOLUME ["/logstash/certs"]

# Copy configuration
COPY config /logstash/config

CMD ["/logstash/bin/logstash", "--quiet",  "-f", "/logstash/config/logstash.conf"]
