FROM openclaw-sandbox-base:latest

USER root
RUN chown -R sandbox:sandbox /home/linuxbrew/.linuxbrew

USER sandbox
RUN brew install steipete/tap/gogcli

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
USER root
RUN chmod 755 /usr/local/bin/entrypoint.sh
USER sandbox

ARG CLIENTSECRET_LOCATION=/workspace/.config/gog/client_secret.json
ARG GOG_ACCOUNT
ARG GOG_KEYRING_PASSWORD=gog
ARG XDG_CONFIG_HOME=/workspace/.config/gog/config

ENV CLIENTSECRET_LOCATION=${CLIENTSECRET_LOCATION}
ENV GOG_ACCOUNT=${GOG_ACCOUNT}
ENV GOG_KEYRING_PASSWORD=${GOG_KEYRING_PASSWORD}
ENV XDG_CONFIG_HOME=${XDG_CONFIG_HOME}

ENTRYPOINT ["entrypoint.sh"]
