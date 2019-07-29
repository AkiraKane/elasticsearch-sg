FROM docker.elastic.co/elasticsearch/elasticsearch:7.1.1

COPY config/sg/ config/sg/
COPY bin/ bin/

# Search Guard plugin
RUN elasticsearch-plugin install --batch com.floragunn:search-guard-7:7.1.1-35.0.0 \
	&& chmod +x plugins/search-guard-7/tools/*.sh \
	&& chown -R elasticsearch config/sg/ \
	&& chmod -R go= config/sg/