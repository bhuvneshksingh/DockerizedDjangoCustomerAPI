#!/bin/sh

# set -e stops the execution of a script if a command or pipeline has an error - 
# which is the opposite of the default shell behaviour, which is to ignore errors in scripts. 
# Type help set in a terminal to see the documentation for this built-in command.
set -e

python manage.py collectstatic --noinput

uwsgi --socket :8000 --master --enable-threads --module app.wsgi