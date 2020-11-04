FROM python:3.8-alpine

ENV PATH="/scripts:${PATH}"

COPY ./requirements.txt /requirements.txt

# PERMANANT dependences
# apk is the package manager that comes with alpine
# --update : update registry before we add it
# --no-cache: Do not store index locally. Used to keep container small
# TEMPORARY dependencies. Needed only for installing
# --virtual: an alias which can be used to remove dependencies later
# Eg. We need gcc to compile the program but do not need it later
RUN apk add --update --no-cache --virtual .tmp gcc postgresql-dev libffi-dev libc-dev linux-headers
 
RUN pip install -r /requirements.txt

# Delete temporary dependencies
RUN apk del .tmp

RUN mkdir /app
COPY ./CustomerAPI /app
WORKDIR /app
COPY ./scripts /scripts

# chmod +x filename or chmod a+x filename  Change permission for all roles on a file/directory
RUN chmod +x /scripts/*

# Directories for storing media and static files
# -p allows creation of sub-directories if not available
RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/

# Create a user. -D represents this user can only run apps.
# This is recommended. Otherwise, the image will be run from root account
RUN adduser -D user

# Give permission to user to access volume dirs
RUN chown -R user:user /vol

# chmod -R 755 directory-name/ the permission to all the files under a directory recursively
# This means owner can do everything, but rest can only read and execute
RUN chmod -R 755 /vol/web

# Switch to this user
USER user

# An ENTRYPOINT helps you to configure a container that you can run as an executable.
CMD ["entrypoint.sh"]