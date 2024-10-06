FROM busybox:latest
ENV PORT=80
LABEL maintainer="Chris <c@crccheck.com>"

ADD index.html /www/index.html
ADD up.html /www/up/index.html

# EXPOSE $PORT

HEALTHCHECK CMD nc -z localhost $PORT

# Create a basic webserver and run it until the container is stopped
CMD echo "httpd started" && trap "exit 0;" TERM INT; httpd -v -p $PORT -h /www -f & wait
