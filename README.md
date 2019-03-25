# Introduction 
Syslog to Log Analytics (Sentinel)

# Getting Started

Look at [My blog post](https://medium.com/@IrekRomaniuk/syslog-to-azure-sentinel-ac7a5902c33e)
also [Logstash Chart documentation](https://github.com/helm/charts/tree/master/stable/logstash)

![Diagram](shakl.png)

# Build and Test
```
helm del --purge loggen
helm install -f charts/logstash/values.Loggen.yaml charts/logstash/ --name loggen --set replicaCount=2

UDP: loggen --inet --dgram --size 300 --rate 1000 --interval 10 10.61.132.35 6666
TCP: loggen --size 300 --rate 1000 --interval 10 10.61.132.38 6667

workspace('defaultaworkspace').Loggen_CL | where TimeGenerated > now() - 10m | count

```

# Contribute
TODO: Explain how other users and developers can contribute to make your code better. 
