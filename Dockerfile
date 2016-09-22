FROM sebp/elk

ENV ES_HOME /usr/share/elasticsearch
WORKDIR ${ES_HOME}

# Install plugins
RUN bin/plugin install license
RUN bin/plugin install shield

# Add specific role
COPY roles.yml /usr/share/elasticsearch/config/shield/

ENV LOGSTASH_PWD logstash
ENV KIBANA_PWD kibana
ENV KIBANA_USER_NAME kibana
ENV KIBANA_USER_PWD kibana

COPY es-entrypoint.sh /
ENTRYPOINT ["/es-entrypoint.sh"]