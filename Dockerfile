FROM gleif/keri:1.0.0

SHELL ["/bin/bash", "-c"]
EXPOSE 5600-5700

WORKDIR /keripy

RUN mkdir -p /usr/local/var/keri

COPY witness-config.json /keripy/keri/cf/witness-config.json
COPY witness-incept-config-sample.json /keripy/witness-incept-config-sample.json
COPY docker_startup.sh ./docker_startup.sh

RUN chmod +x ./docker_startup.sh

ENTRYPOINT ["./docker_startup.sh"]
