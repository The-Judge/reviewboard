FROM alpine

RUN apk update
RUN apk add bash python2-dev python2 py-pip patch util-linux coreutils binutils findutils grep gcc abuild make cmake \
    mariadb-dev postgresql-dev musl-dev libffi-dev libsodium-dev libjpeg-turbo-dev zlib-dev tiff-dev freetype-dev \
    lcms2-dev libwebp-dev tcl-dev openjpeg-dev cvs git mercurial subversion-dev apr-dev apr-util-dev linux-headers
RUN pip install -U pip setuptools
RUN pip install python-memcached mysql-python psycopg2 ReviewBoard svn django-storages django-storage-swift \
    cryptography RBTools

COPY uwsgi.ini /etc/reviewboard/uwsgi.ini
COPY run.sh /etc/reviewboard/run.sh
RUN chmod +x /etc/reviewboard/run.sh

ENV UWSGI_PROCESSES 10

VOLUME "/media"
VOLUME "/var/www"
EXPOSE 8000

CMD ["/etc/reviewboard/run.sh"]
