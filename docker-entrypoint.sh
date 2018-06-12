#!/bin/sh
set -e

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- php /vendor/bin/phpdcd "$@"
elif [ "$1" = "/vendor/bin/phpdcd" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpdcd" ]; then
  set -- /sbin/tini -- php /vendor/bin/"$@"
fi

exec "$@"
