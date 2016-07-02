# Sniproxy Dockerfile

## Base Docker Image
....

## Build Image

```
docker build -t sniproxy .
```

## Usage

```
docker run -d -name sniproxy sniproxy
```

## Custom Config

1. After the build modify `sniproxy.conf`
2. run add `-v you config:/etc/sniproxy.conf`
