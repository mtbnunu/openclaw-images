FROM openclaw-sandbox-base:latest

USER root
RUN chown -R sandbox:sandbox /home/linuxbrew/.linuxbrew

USER sandbox
ENV XDG_CONFIG_HOME=/workspace/.config/gog/config
ENV GOG_KEYRING_PASSWORD=gog
RUN brew install steipete/tap/gogcli
