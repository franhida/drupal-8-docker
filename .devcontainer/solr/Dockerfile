FROM solr:8.5.2
ARG SOLR_CORE
COPY config.zip /tmp/config.zip
RUN unzip /tmp/config.zip -d /tmp/drupal-conf
RUN /opt/solr/bin/solr create_core -c ${SOLR_CORE} -d /tmp/drupal-conf -n ${SOLR_CORE}