FROM solr:8.5.2
COPY config.zip /tmp/config.zip
USER root
RUN unzip /tmp/config.zip -d /opt/solr/server/solr/configsets/drupal-conf
USER solr