FROM amazonlinux
MAINTAINER PR Reddy "trainings@edwiki.in"
RUN yum install git -y

RUN mkdir /root/.ssh

COPY ./id_rsa /root/.ssh/id_rsa

RUN chmod -R 700 /root/.ssh  && \
    chown -R root:root /root/.ssh && \
    chmod 600 /root/.ssh/id_rsa && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN git clone git@github.com:dptrealtime/eos-cloud-config-repo.git  /etc/eos-cloud-config-repo
RUN amazon-linux-extras install java-openjdk11 -y
ADD target/server-0.0.1-SNAPSHOT.jar eos-cloud-config-api.jar
CMD ["java","-jar","eos-cloud-config-api.jar"]
