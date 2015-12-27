FROM erdii/debian-8.2-ssh


RUN apt-get install --no-install-recommends -y \
    ca-certificates \
    git \
    build-essential \
    libzmq-dev \
    libpq-dev \
    python-dev \
    virtualenv \
    python-virtualenv \
    && apt-get clean

RUN mkdir /wd
WORKDIR /wd

RUN git clone https://github.com/mozilla-services/syncserver

WORKDIR /wd/syncserver
RUN echo "psycopg2" >> requirements.txt

RUN make build
RUN make test

RUN mkdir /conf
ADD ./syncserver.ini /conf

VOLUME ["/conf"]

EXPOSE 5000

CMD /wd/syncserver/local/bin/gunicorn --paste /conf/syncserver.ini

