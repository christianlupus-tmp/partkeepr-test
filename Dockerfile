
FROM partkeepr/development:latest
RUN mkdir /test-data
RUN apt-get update && apt-get install -y lsb-release
COPY config_test.yml /test-data/config_test.yml
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
