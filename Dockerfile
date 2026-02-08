FROM maxpain62/maven-3.9:jre11
RUN mkdir /etc/eos-cloud-config-repo/
ADD target/cloud-config-0.0.1-RELEASE.jar eos-cloud-config-api.jar
ENTRYPOINT ["java","-jar","eos-cloud-config-api.jar"]