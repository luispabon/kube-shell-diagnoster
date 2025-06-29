# Kube shell diagnoster

A small container that can be use in kubernetes (or elsewhere) for debugging shenanigans, like naming resolution.

## Features
 * Fish shell
 * `amqp-tools`
 * `aws-cli`
 * `cURL`
 * `dig`
 * `jq`
 * `mongosh` 1.x
 * `nano`
 * `nslookup`
 * `ping`
 * `redis-tools`
 * `sudo`
 * `wget`
 * `yq`

## Examples

### Without istio
```shell
kubectl run ---rm --restart=Never -it your_pod_name --image docker.io/luispabon/kube-shell-diagnoster:2
```


### With istio and running under another service account
```shell
kubectl run --labels="sidecar.istio.io/inject=false" --rm --restart=Never -it --overrides='{ "spec": { "serviceAccountName": "your-service-account" }}' your_pod_name --image docker.io/luispabon/kube-shell-diagnoster:2
```
