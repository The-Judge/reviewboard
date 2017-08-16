#!/bin/bash

rb-site install --noinput \
       --domain-name="${DOMAIN:localhost}" \
       --site-root="${SITE_ROOT:/}" --static-url=static/ --media-url=media/ \
       --db-type="${DB_TYPE:postgresql}" \
       --db-name="${DB_NAME:reviewboard}" \
       --db-host="${DB_HOST}" \
       --db-user="${DB_USER:reviewboard}" \
       --db-pass="${DB_PASSWORD:reviewboard}" \
       --cache-type=memcached --cache-info="memcached://memcached:11211" \
       --web-server-type=lighttpd --web-server-port=8000 \
       --admin-user="${RB_ADMIN:admin}" --admin-password=${RB_PASSWORD:admin} \
       --admin-email=${RB_ADMIN_EMAIL:admin@example.com} \
       /var/www/reviewboard/

exec uwsgi --ini /etc/reviewboard/uwsgi.ini
