FROM dpthub/amazonbase
ADD target/server-0.0.1-RELEASE.jar eos-cloud-config-api.jar
CMD ["java","-jar","eos-cloud-config-api.jar"]
