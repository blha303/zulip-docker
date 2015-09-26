FROM ubuntu:14.04
MAINTAINER Steven Smith <stevensmith.ome@gmail.com>
RUN apt-get update && apt-get install -y python-dev python-pip libffi-dev memcached rabbitmq-server libldap2-dev redis-server postgresql-server-dev-all libmemcached-dev postgresql-9.3 wget git && wget https://dl.dropboxusercontent.com/u/283158365/zuliposs/postgresql-9.3-tsearch-extras_0.1.2_amd64.deb -O/tmp/postgresql-9.3-tsearch-extras_0.1.2_amd64.deb && dpkg -i /tmp/postgresql-9.3-tsearch-extras_0.1.2_amd64.deb
RUN git clone https://github.com/zulip/zulip /opt/zulip --depth=1
WORKDIR /opt/zulip
RUN pip install -r requirements.txt
RUN ./scripts/setup/configure-rabbitmq && ./tools/postgres-init-db && ./tools/do-destroy-rebuild-database && ./tools/emoji_dump/build_emoji
