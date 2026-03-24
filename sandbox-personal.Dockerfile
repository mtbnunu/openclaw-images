FROM openclaw-sandbox-base:latest

USER root
RUN chown -R sandbox:sandbox /home/linuxbrew/.linuxbrew

USER sandbox
RUN brew install steipete/tap/gogcli
