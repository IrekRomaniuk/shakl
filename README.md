# Introduction 
Syslog to Log Analytics

# Getting Started

Loog at [Logstash Chart documentation](https://github.com/helm/charts/tree/master/stable/logstash)


# Build and Test
```
export KUBECONFIG=/mnt/c/Users/irekromaniuk/AzureDevOps/aks-engine/_output/k8sdev/kubeconfig/kubeconfig.eastus.json
helm del --purge panthreat
helm install -f charts/logstash/values.PanThreat.yaml charts/logstash/ --name panthreat
helm del --purge pantraffic
helm install -f charts/logstash/values.PanTraffic.yaml charts/logstash/ --name pantraffic

helm install -f charts/logstash/values.Loggen.yaml charts/logstash/ --name logstash-dry --dry-run --debug > charts/logstash-dry-run.yml
helm install -f charts/logstash/values.Loggen.yaml charts/logstash/ --name loggen --set replicaCount=2

UDP: loggen --inet --dgram --size 300 --rate 1000 --interval 10 10.61.132.35 6666
TCP: loggen --size 300 --rate 1000 --interval 10 10.61.132.38 6667
syslog-generator -ip="10.61.132.37" -port="12514" -protocol="tcp" -src="11.22.3.4" -sev=medium -freq=100 -count=1000
syslog-generator -ip="10.61.132.39" -port="12515" -protocol="tcp" -src="11.22.3.4" -sev=medium -freq=100 -count=1000 -type="Traffic"


workspace('defaultaworkspace').Loggen_CL | where TimeGenerated > now() - 10m | count
workspace('cfn-prod-loganalytics').PanThreat_CL | where TimeGenerated > now() - 10m
```

# Contribute
TODO: Explain how other users and developers can contribute to make your code better. 
