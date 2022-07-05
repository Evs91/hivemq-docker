FROM bitnami/java:latest
ENV HIVEMQ_HOME='/opt/hivemq'
ENV HIVEMQ_USER='hivemq'
ENV HIVEMQ_PORT='1883'
ENV HIVEMQ_MAXTOPICS='5'
EXPOSE 1883
EXPOSE 8080
WORKDIR /opt/
COPY hivemq-4.8.1.zip /opt/hivemq-4.8.1.zip
RUN /bin/bash -c 'cd /opt'
RUN /bin/bash -c 'apt-get update'
RUN /bin/bash -c 'apt-get install unzip -y'
RUN /bin/bash -c 'unzip hivemq-4.8.1.zip'
RUN /bin/bash -c 'ln -s /opt/hivemq-4.8.1 /opt/hivemq'
COPY config.xml /opt/hivemq-4.8.1/conf/config.xml
RUN /bin/bash -c 'useradd -d /opt/hivemq hivemq'
RUN /bin/bash -c 'chown -R hivemq:hivemq /opt/hivemq-4.8.1'
RUN /bin/bash -c 'chown -R hivemq:hivemq /opt/hivemq'
RUN /bin/bash -c 'chmod +x /opt/hivemq/bin/run.sh'
RUN /bin/bash -c 'cp /opt/hivemq/bin/init-script/hivemq-debian /etc/init.d/hivemq'
RUN /bin/bash -c 'chmod +x /etc/init.d/hivemq'
RUN /bin/bash -c 'cd /opt/hivemq'
CMD /bin/bash -c '/opt/hivemq/bin/run.sh'
