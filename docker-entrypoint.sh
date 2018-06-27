#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpdcd "$@"
elif [ "$1" = "/composer/vendor/bin/phpdcd" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpdcd" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/"$@"
fi

exec "$@"
