FROM alpine

LABEL maintainer="Sagit <qinghan89@gmail.com>"

RUN wget https://github.com/pymumu/smartdns/releases/download/Release35/smartdns.1.2021.08.27-1923.x86_64-linux-all.tar.gz \
  && tar zxvf smartdns.*.tar.gz \
  && mv smartdns/usr/sbin/smartdns /bin/smartdns \
  && chmod +x /bin/smartdns \
  && rm -rf smartdns*

ADD start.sh /start.sh
ADD config.conf /config.conf

WORKDIR /

VOLUME ["/smartdns"]

EXPOSE 53

CMD ["/start.sh"]
