FROM apache/nifi:1.8.0

COPY --chown=nifi:nifi enron_small.tgz enron_small.tgz
RUN tar -zxf enron_small.tgz
COPY --chown=nifi:nifi start.sh /opt/nifi/scripts/start_tmp.sh
RUN sh -c 'cat /opt/nifi/scripts/start_tmp.sh | tr -d "\r" > /opt/nifi/scripts/start.sh'
