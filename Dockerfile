FROM tezos/tezos:carthagenet_ee87c704_20191211160332

# Install AWS CLI

USER root
RUN \
	apk -Uuv add groff less python py-pip curl jq && \
	pip install awscli && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*

COPY ./start-updater.sh /home/tezos/start-updater.sh
RUN chmod 755 /home/tezos/start-updater.sh

USER tezos
EXPOSE 8732 9732
ENTRYPOINT ["/home/tezos/start-updater.sh"]
