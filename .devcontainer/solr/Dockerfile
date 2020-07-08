FROM solr:8.5.2
ARG SOLR_CORE
COPY config.zip /tmp/config.zip
RUN unzip /tmp/config.zip -d /tmp/drupal-conf
RUN precreate-core ${SOLR_CORE} /tmp/drupal-conf