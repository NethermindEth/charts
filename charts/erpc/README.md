# erpc

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.23](https://img.shields.io/badge/AppVersion-0.0.23-informational?style=flat-square)

A Helm chart to deploy eRPC instances

**Homepage:** <https://docs.erpc.cloud>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| cbermudez97 |  |  |
| AntiD2ta |  |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 1.0.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| erpc.config.logLevel | string | `"warn"` | Erpc log level. |
| erpc.config.metrics | object | `{"enabled":true,"hostV4":"0.0.0.0","hostV6":"[::]","listenV4":true,"listenV6":false,"port":4001}` | Erpc prometheus metrics server configuration. |
| erpc.config.projects | list | `[{"id":"","networks":[{"chainId":1,"failsafe":{},"type":"evm"}],"upstreams":[{"chainId":1,"endpoint":{"secret":{"enabled":false,"key":""},"value":""},"failsafe":{},"id":"","type":"evm"}]}]` | Erpc projects configuration. |
| erpc.config.projects[0].id | string | `""` | Project id to be used. Must be a valid http path. |
| erpc.config.projects[0].networks | list | `[{"chainId":1,"failsafe":{},"type":"evm"}]` | Project networks to be used. |
| erpc.config.projects[0].networks[0].chainId | int | `1` | Chain id of the network. |
| erpc.config.projects[0].networks[0].failsafe | object | `{}` | Failsafe policies to be used for this network. Ref: https://docs.erpc.cloud/config/failsafe |
| erpc.config.projects[0].networks[0].type | string | `"evm"` | Chain type to be used. Only `evm` is supported at the moment. |
| erpc.config.projects[0].upstreams[0].chainId | int | `1` | Upstream chain id to be used. |
| erpc.config.projects[0].upstreams[0].endpoint | object | `{"secret":{"enabled":false,"key":""},"value":""}` | Upstream endpoint to be used. |
| erpc.config.projects[0].upstreams[0].endpoint.secret | object | `{"enabled":false,"key":""}` | Optional secret key to be used. This key is taken from the configured `erpc.secret` resource. |
| erpc.config.projects[0].upstreams[0].endpoint.value | string | `""` | Optional endpoint value. Ignored if the endpoint is using the `secret` configuration. |
| erpc.config.projects[0].upstreams[0].failsafe | object | `{}` | Failsafe policies to be used for this upstream. Ref: https://docs.erpc.cloud/config/failsafe |
| erpc.config.projects[0].upstreams[0].id | string | `""` | Upstream id to be used. Must be a valid http path. |
| erpc.config.projects[0].upstreams[0].type | string | `"evm"` | Upstream type to be used. |
| erpc.config.server | object | `{"httpHostV4":"0.0.0.0","httpHostV6":"[::]","httpPort":4000,"listenV4":true,"listenV6":false}` | Erpc json-rpc server configuration. |
| erpc.image | object | `{"pullPolicy":"IfNotPresent","repository":"ghcr.io/erpc/erpc","tag":"0.0.23"}` | Erpc image to be used. |
| erpc.replicaCount | int | `3` | Erpc deployment replica count. |
| erpc.resources | object | `{"limits":{"cpu":"2","memory":"3Gi"},"requests":{"cpu":"2","memory":"3Gi"}}` | Erpc container resources. |
| erpc.secret | object | `{"name":""}` | Erpc required secret used for the init container. All keys used for configurations secrets must be defined inside this secret resource. |
| global.namespaceOverride | string | `""` |  |
| global.serviceAccount | object | `{"annotations":{},"create":false}` | Service account. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/ |
| global.suffix | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` | Ingress class name. |
| ingress.enabled | bool | `false` | Enable Ingress. |
| ingress.hosts | list | `[]` | Hostnames. Can be provided if Ingress is enabled. |
| ingress.labels | object | `{}` |  |
| ingress.routePrefix | string | `"/"` | Route prefix. Can skip it if any item of path has the path defined. |
| ingress.tls | list | `[]` | TLS configuration for Ingress Secret must be manually created in the namespace  |
| initImage | object | `{"pullPolicy":"IfNotPresent","repository":"bash","tag":"5.2"}` | Init image is used to generate the erpc config file. |
| service.annotations | object | `{}` | Erpc Service annotations. |
| service.metricsPort | int | `9000` | Erpc Service metrics port. |
| service.port | int | `80` | Erpc Service port. |
| service.type | string | `"ClusterIP"` | Erpc Service type. |
| serviceAccount | object | `{"annotations":{},"name":""}` | Service account. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/ |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
