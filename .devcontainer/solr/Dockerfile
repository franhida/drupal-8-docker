FROM solr:8.5.2
ARG SOLR_CORE
COPY config.zip /tmp/config.zip
RUN unzip /tmp/config.zip -d /opt/solr/server/solr/configsets/drupal-conf
RUN precreate-core ${SOLR_CORE} /opt/solr/server/solr/configsets/drupal-conf