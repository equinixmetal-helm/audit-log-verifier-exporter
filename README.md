# audit-log-verifier-exporter
Prometheus exporter that verifies node is writing to audit.log

script-exporter.yml
```
docker run -p 9172:9172 -v `pwd`/script-exporter.yml:/usr/app/script-exporter.yml:ro -it ale --config.file /usr/app/script-exporter.yml

```