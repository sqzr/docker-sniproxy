# Sniproxy Dockerfile

**Allow all sites by default proxy, this insecurity**

## Base Docker Image
[Docker hub](https://hub.docker.com/r/sqzrcc/sniproxy/)

## Build Image

```
docker build -t sniproxy .
```

## Usage

```
docker run -p 443:443 -d -name sniproxy sniproxy
```

## Custom Config

default `sniproxy.conf:`

```
user daemon

pidfile /var/run/sniproxy.pid

listener 443 {
    protocol tls
    table https_hosts
}

table https_hosts {
.* *:443
}
```

1. After the build modify `sniproxy.conf`
2. run add `-v you config:/etc/sniproxy.conf`
