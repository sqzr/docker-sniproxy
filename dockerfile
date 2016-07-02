FROM debian:jessie 

MAINTAINER sqzryang monkeysqzr@gmail.com

RUN apt-get update \
        && apt-get -y install cdbs debhelper dh-autoreconf autotools-dev \
                gettext pkg-config libev-dev libpcre3-dev libudns-dev \
                build-essential wget dpkg-dev \
        && echo "=== Retrieving package =================" \
        && wget -O /tmp/sniproxy_0.4.0.tar.gz \
                https://github.com/dlundquist/sniproxy/archive/0.4.0.tar.gz \
        && echo "=== Building package ===================" \
        && ( cd /tmp && tar -xzvf sniproxy_0.4.0.tar.gz \
                && cd /tmp/sniproxy-0.4.0 \
                && ./autogen.sh \
                && dpkg-buildpackage -us -uc -b ) \
        && echo "=== Installing package =================" \
        && dpkg -i /tmp/*.deb \
        && echo "=== Cleaning up ========================" \
        && rm -fr /tmp/sniproxy* \
        && apt-get purge -y debhelper dh-autoreconf autotools-dev wget dpkg-dev \
                pkg-config libev-dev libpcre3-dev libudns-dev build-essential

COPY sniproxy.conf /etc/sniproxy.conf

EXPOSE 443

ENTRYPOINT sniproxy -f
