# https://github.com/elastic/logstash-docker
# FROM docker.elastic.co/logstash/logstash:6.6.0
FROM docker.elastic.co/logstash/logstash-oss:6.3.0

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
#RUN logstash-plugin install logstash-filter-geoip logstash-filter-csv
RUN logstash-plugin install logstash-output-azure_loganalytics logstash-filter-csv

# USER logstash
#RUN mkdir -p /usr/share/logstash/log
#RUN chown logstash:root /usr/share/logstash/log
