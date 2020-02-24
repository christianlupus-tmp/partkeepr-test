
FROM partkeepr/development:latest
RUN mkdir /test-data
COPY config_test.yml /test-data/config_test.yml
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
