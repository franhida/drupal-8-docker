FROM solr:8.5.2
ARG SOLR_CORE
RUN mkdir /home/solr
COPY .bashrc /home/solr/.bashrc
COPY config.zip /home/solr/config.zip
RUN unzip /home/solr/config.zip -d /home/solr/drupal-conf
RUN /opt/solr/bin/solr create_core -c ${SOLR_CORE} -d /home/solr/drupal-conf -n ${SOLR_CORE}