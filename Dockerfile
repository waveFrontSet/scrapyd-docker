ARG PYTHON_VERSION="3.12"
ARG SCRAPYD_VERSION="1.5.0"

FROM python:${PYTHON_VERSION}-alpine
RUN apk --no-cache add --virtual build-dependencies \
   gcc \
   musl-dev \
   libffi-dev \
   libressl-dev \
   libxml2-dev \
   libxslt-dev \
 && pip install --no-cache-dir \
   scrapyd==$SCRAPYD_VERSION \
 && apk del build-dependencies \
 && apk add \
   libressl \
   libxml2 \
   libxslt

EXPOSE 6800
ENTRYPOINT ["scrapyd", "--pidfile=", "-l", "-"]
