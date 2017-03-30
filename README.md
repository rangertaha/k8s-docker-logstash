# k8s-docker-logstash

Logstash Docker image for kubernetes.

[![Docker Repository on Quay.io](https://quay.io/repository/rangertaha/k8s-docker-logstash/status "Docker Repository on Quay.io")](https://quay.io/repository/rangertaha/k8s-docker-logstash)

## Installs

* [OpenJDK 8u112](http://openjdk.java.net/projects/jdk8u/releases/8u112.html)
* [Logstash 5.3.0](https://www.elastic.co/guide/en/logstash/5.3/logstash-5-3-0.html)

## Run

Assuming:
* `/logstash/config` - where `logstash` will look for `logstash.conf` file
* `/logstash/certs` - where `logstash` will look for certificate files

Run:

```
docker run --name logstash \
	--detach \
	--volume /home/rangertaha/logstash:/logstash/config \
	quay.io/rangertaha/k8s-docker-logstash
```

or

```
docker run --name logstash \
	--detach \
	--volume /home/rangertaha/logstash:/logstash/config \
	--volume /home/rangertaha/logstash-certs:/logstash/certs \
	quay.io/rangertaha/k8s-docker-logstash
```
